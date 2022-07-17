;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname merge-sort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; merge-sort.rkt

;(require racket/list)
;; Divide and conquer merge type

;; (listof Number) -> (listof Number)
;; it consumes a lon and produces it sorted in ascending order

(check-expect (merge-sort empty) empty)
(check-expect (merge-sort (list 1)) (list 1))
(check-expect (merge-sort (list 1 1 1 1)) (list 1 1 1 1))
(check-expect (merge-sort (list 1 2 3 4)) (list 1 2 3 4))
(check-expect (merge-sort (list 4 2 3 1)) (list 1 2 3 4))
(check-expect (merge-sort (list 3 4 2 1)) (list 1 2 3 4))
(check-expect (merge-sort (list 4 3 2 1)) (list 1 2 3 4))

;(define (merge-sort lon) lon) ;stub

(define (merge-sort lon)
  (local [(define (take lon0 n)
            ;; acc is Natural; It is the index of the actual element
            (local [(define (take lon acc)
                      (cond [(empty? lon) empty]
                            [(< acc n)
                             (cons (first lon) (take (rest lon) (add1 acc)))]
                            [else empty]))]
              (take lon0 0)))
          
          (define (drop lon0 n)
            ;; acc is Natural; It is the index of the actual element
            (local [(define (drop lon acc)
                      (cond [(empty? lon) empty]
                            [(< acc n)
                             (drop (rest lon) (add1 acc))]
                            [else lon]))]
              (drop lon0 0)))
          
          (define (merge lon01 lon02)
            ;; res is (listof Number); it is the sorted list so far
            (local [(define (merge lon1 lon2 res)
                      (cond [(empty? lon1)  (append res lon2)]
                            [(empty? lon2)  (append res lon1)]
                            [(> (first lon1) (first lon2))
                             (merge lon1 (rest lon2) (append res (list (first lon2))))]
                            [else
                             (merge (rest lon1) lon2 (append res (list (first lon1))))]))]
              (merge lon01 lon02 empty)))]
                   
    (cond [(empty? lon) empty]
          [(empty? (rest lon)) lon]
          [else
           (merge (merge-sort (take lon (quotient (length lon) 2)))      ;first length/2 elements
                  (merge-sort (drop lon (quotient (length lon) 2))))]))) ;second length/2 elements