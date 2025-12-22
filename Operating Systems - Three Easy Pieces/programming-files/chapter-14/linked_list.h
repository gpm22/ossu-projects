#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *next;
} Node;

typedef struct {
    Node *head;
    Node *tail;
    size_t size;
} LinkedList;

LinkedList* linkedlist_create();
int linkedlist_add(LinkedList *list, int value);
int linkedlist_get(LinkedList *list, size_t index, int *value);
int linkedlist_set(LinkedList *list, size_t index, int value);
int linkedlist_remove(LinkedList *list, size_t index);
size_t linkedlist_size(LinkedList *list);
void linkedlist_destroy(LinkedList *list);
void linkedlist_print(LinkedList *list);

#endif
