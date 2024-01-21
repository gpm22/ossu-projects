import math


class Heap:
    def __init__(self):
        self.elements = []
        self.positions = {}

    def find_min(self):
        if self.empty():
            return None
        return self.elements[0]

    def get_element(self, element):
        position = self.positions[element]
        return self.elements[position]

    def extract_min(self):
        if self.empty():
            return None
        return self.delete(self.elements[0][1])

    def heapify(self, arr):
        self.elements = arr
        self.positions = {e[1]: i for i, e in enumerate(self.elements)}
        for i in range(len(arr)):
            self.__bubble_down(i)
        for i in range(len(arr)):
            self.__bubble_up(i)

    def insert(self, element):
        self.elements.append(element)
        position = len(self.elements) - 1
        self.positions[element[1]] = position
        self.__bubble_up(position)
        return element

    def delete(self, element):
        position = self.positions[element]

        lastElement = self.elements[-1][1]
        (
            self.elements[position],
            self.elements[-1],
            self.positions[element],
            self.positions[lastElement],
        ) = (
            self.elements[-1],
            self.elements[position],
            self.positions[lastElement],
            self.positions[element],
        )

        deleted = self.elements.pop()
        del self.positions[element]
        self.__solve_conflicts(position)
        return deleted

    def update(self, element):
        position = self.positions[element[1]]
        if element[0] == self.elements[position][0]:
            return
        self.elements[position] = element
        self.__solve_conflicts(position)

    def __repr__(self):
        return f"elements: {[f'heap key: {pair[0]} - position {self.positions[pair[1]]} - element: {pair[1]}' for pair in self.elements]}"

    def __str__(self):
        return self.__repr__()

    def empty(self):
        return len(self.elements) == 0

    def size(self):
        return len(self.elements)

    def include(self, element):
        return element in self.positions

    def __solve_conflicts(self, position):
        parentPosition = self.__get_parent_position(position)

        if position >= len(self.elements):
            return
        if (
            self.__is_root(position)
            or self.elements[parentPosition][0] < self.elements[position][0]
        ):
            self.__bubble_down(position)
        else:
            self.__bubble_up(position)

    def __bubble_up(self, startPosition):
        position = startPosition
        parentPosition = self.__get_parent_position(position)

        while (
            not self.__is_root(position)
            and self.elements[parentPosition][0] > self.elements[position][0]
        ):
            parentElement = self.elements[parentPosition][1]
            childElement = self.elements[position][1]

            (
                self.elements[parentPosition],
                self.elements[position],
                self.positions[parentElement],
                self.positions[childElement],
            ) = (
                self.elements[position],
                self.elements[parentPosition],
                self.positions[childElement],
                self.positions[parentElement],
            )

            position = parentPosition
            parentPosition = self.__get_parent_position(position)

    def __bubble_down(self, startPosition):
        position = startPosition
        smallerChildPosition = self.__get_smaller_child_position(position)
        while (
            smallerChildPosition < len(self.elements)
            and self.elements[smallerChildPosition][0] < self.elements[position][0]
        ):
            smallerChildElement = self.elements[smallerChildPosition][1]
            currentElement = self.elements[position][1]
            (
                self.elements[smallerChildPosition],
                self.elements[position],
                self.positions[smallerChildElement],
                self.positions[currentElement],
            ) = (
                self.elements[position],
                self.elements[smallerChildPosition],
                self.positions[currentElement],
                self.positions[smallerChildElement],
            )
            position = smallerChildPosition
            smallerChildPosition = self.__get_smaller_child_position(position)

    def __get_parent_position(self, position):
        return math.ceil((position / 2.0)) - 1

    def __get_left_child_position(self, position):
        return 2 * position + 1

    def __get_right_child_position(self, position):
        return 2 * position + 2

    def __is_root(self, position):
        return position == 0

    def __get_smaller_child_position(self, position):
        left = self.__get_left_child_position(position)
        right = self.__get_right_child_position(position)

        if right > len(self.elements) - 1:
            return left

        if self.elements[left][0] < self.elements[right][0]:
            return left
        else:
            return right
