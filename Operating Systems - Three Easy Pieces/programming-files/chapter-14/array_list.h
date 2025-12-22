// array_list.h
#ifndef ARRAYLIST_H
#define ARRAYLIST_H

#include <stdlib.h>

typedef struct {
    int *data;
    size_t size;
    size_t capacity;
} ArrayList;

ArrayList* arraylist_create(size_t initial_capacity);
int arraylist_add(ArrayList *list, int value);
int arraylist_get(ArrayList *list, size_t index, int *value);
int arraylist_set(ArrayList *list, size_t index, int value);
int arraylist_remove(ArrayList *list, size_t index);
size_t arraylist_size(ArrayList *list);
size_t arraylist_capacity(ArrayList *list);
void arraylist_destroy(ArrayList *list);
void arraylist_print(ArrayList *list);

#endif
