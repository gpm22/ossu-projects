#include "linked_list.h"
#include <stdio.h>

LinkedList* linkedlist_create() {
    LinkedList *list = malloc(sizeof(LinkedList));
    if (!list) return NULL;
    
    list->head = NULL;
    list->tail = NULL;
    list->size = 0;
    return list;
}

int linkedlist_add(LinkedList *list, int value) {
    Node *new_node = malloc(sizeof(Node));
    if (!new_node) return 0;
    
    new_node->data = value;
    new_node->next = NULL;
    
    if (list->size == 0) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
    
    list->size++;
    return 1;
}

int linkedlist_get(LinkedList *list, size_t index, int *value) {
    if (index >= list->size) return 0;
    
    Node *current = list->head;
    for (size_t i = 0; i < index; i++) {
        current = current->next;
    }
    
    *value = current->data;
    return 1;
}

int linkedlist_set(LinkedList *list, size_t index, int value) {
    if (index >= list->size) return 0;
    
    Node *current = list->head;
    for (size_t i = 0; i < index; i++) {
        current = current->next;
    }
    
    current->data = value;
    return 1;
}

int linkedlist_remove(LinkedList *list, size_t index) {
    if (index >= list->size) return 0;
    
    Node *to_delete;
    
    if (index == 0) {
        // Remove head
        to_delete = list->head;
        list->head = list->head->next;
        if (list->size == 1) {
            list->tail = NULL;
        }
    } else {
        // Find node before the one to delete
        Node *prev = list->head;
        for (size_t i = 0; i < index - 1; i++) {
            prev = prev->next;
        }
        
        to_delete = prev->next;
        prev->next = to_delete->next;
        
        if (index == list->size - 1) {
            list->tail = prev;
        }
    }
    
    free(to_delete);
    list->size--;
    return 1;
}

size_t linkedlist_size(LinkedList *list) {
    return list->size;
}

void linkedlist_destroy(LinkedList *list) {
    Node *current = list->head;
    while (current) {
        Node *next = current->next;
        free(current);
        current = next;
    }
    free(list);
}

void linkedlist_print(LinkedList *list) {
    printf("[");
    Node *current = list->head;
    while (current) {
        printf("%d", current->data);
        if (current->next) printf(", ");
        current = current->next;
    }
    printf("]\n");
}
