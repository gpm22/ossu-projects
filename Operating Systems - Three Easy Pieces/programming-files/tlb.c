#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <math.h>

// Configuration
#define MIN_PAGES 1
#define MAX_PAGES 1024  // Should be enough for most TLBs
#define TRIALS_PER_SIZE 1000000
#define NUM_RUNS 5      // For averaging

static long get_page_size(void) {
    long page_size = sysconf(_SC_PAGESIZE);
    if (page_size < 0) {
        perror("sysconf");
        exit(EXIT_FAILURE);
    }
    return page_size;
}

static long get_time_usec(void) {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000000 + tv.tv_usec;
}

static void warm_up(void) {
    volatile int sink = 0;
    for (int i = 0; i < 1000000; i++) {
        sink += i;
    }
    (void)sink;
}

double measure_tlb_access_time(int num_pages, int num_trials) {
    long page_size = get_page_size();
    int jump = page_size / sizeof(int);
    
    // Allocate slightly more to avoid any allocation artifacts
    size_t array_size = (num_pages + 1) * page_size;
    int *array = calloc(num_pages + 1, page_size);
    if (array == NULL) {
        fprintf(stderr, "Allocation failed for %d pages\n", num_pages);
        exit(EXIT_FAILURE);
    }
    
    // Touch all pages
    for (int i = 0; i < num_pages * jump; i += jump) {
        array[i] = 0;
    }
    
    warm_up();
    
    long start_time = get_time_usec();
    
    for (int trial = 0; trial < num_trials; trial++) {
        for (int i = 0; i < num_pages * jump; i += jump) {
            array[i] += 1;
        }
    }
    
    long end_time = get_time_usec();
    
    free(array);
    
    long total_time = end_time - start_time;
    long total_accesses = num_trials * num_pages;
    
    return (total_time * 1000.0) / total_accesses; // Return nanoseconds
}

void detect_tlb_size(void) {
    printf("Detecting TLB size by measuring access times...\n");
    printf("Pages\tAvg Time (ns)\tChange\t%% Increase\n");
    printf("------------------------------------------------\n");
    
    double prev_time = 0;
    int suspected_tlb_size = 0;
    double max_increase = 0;
    
    for (int pages = MIN_PAGES; pages <= MAX_PAGES; pages *= 2) {
        double total_time = 0;
        
        // Average over multiple runs
        for (int run = 0; run < NUM_RUNS; run++) {
            total_time += measure_tlb_access_time(pages, TRIALS_PER_SIZE / pages);
        }
        
        double avg_time = total_time / NUM_RUNS;
        double change = (prev_time > 0) ? avg_time - prev_time : 0;
        double percent_increase = (prev_time > 0) ? (change / prev_time * 100) : 0;
        
        printf("%d\t%.2f\t\t", pages, avg_time);
        if (pages > MIN_PAGES) {
            printf("%.2f\t%.1f%%", change, percent_increase);
            
            // Detect significant jump (likely TLB capacity exceeded)
            if (percent_increase > 20.0 && suspected_tlb_size == 0) {
                suspected_tlb_size = pages / 2; // Previous size was within TLB
                max_increase = percent_increase;
            }
        }
        printf("\n");
        
        prev_time = avg_time;
        
        // Stop if we've found a clear jump and have gone well beyond it
        if (suspected_tlb_size > 0 && pages > suspected_tlb_size * 4) {
            break;
        }
    }
    
    if (suspected_tlb_size > 0) {
        printf("\n=== DETECTED TLB SIZE ===\n");
        printf("Estimated L1 TLB capacity: %d pages\n", suspected_tlb_size);
        printf("Estimated L1 TLB entries: %d\n", suspected_tlb_size);
        printf("(Assuming 4KB pages, this is %d KB of address space)\n", 
               suspected_tlb_size * 4);
    } else {
        printf("\nNo clear TLB size detected within measured range.\n");
        printf("TLB might be larger than %d pages, or system has multiple TLBs.\n", 
               MAX_PAGES);
    }
}

int main(int argc, char *argv[]) {
    printf("=== TLB Measurement Tool ===\n");
    printf("Based on Saavedra-Barrera's methodology from OSTEP\n\n");
    
    long page_size = get_page_size();
    printf("System page size: %ld bytes\n\n", page_size);
    
    if (argc == 1) {
        // Automatic detection mode
        detect_tlb_size();
    } else if (argc == 3) {
        // Manual measurement mode
        int num_pages = atoi(argv[1]);
        int num_trials = atoi(argv[2]);
        
        if (num_pages <= 0 || num_trials <= 0) {
            fprintf(stderr, "Both arguments must be positive integers\n");
            return EXIT_FAILURE;
        }
        
        double avg_time = measure_tlb_access_time(num_pages, num_trials);
        
        printf("\n=== MEASUREMENT RESULTS ===\n");
        printf("Pages: %d\n", num_pages);
        printf("Trials: %d\n", num_trials);
        printf("Average TLB access time: %.2f nanoseconds\n", avg_time);
        
        if (page_size == 4096) {
            printf("Address space covered: %d KB\n", num_pages * 4);
        }
    } else {
        fprintf(stderr, "Usage:\n");
        fprintf(stderr, "  %s                       - Auto-detect TLB size\n", argv[0]);
        fprintf(stderr, "  %s <num_pages> <trials>  - Manual measurement\n", argv[0]);
        fprintf(stderr, "\nExample: %s 16 1000000\n", argv[0]);
        return EXIT_FAILURE;
    }
    
    return EXIT_SUCCESS;
}
