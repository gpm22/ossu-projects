import unittest
from heap import Heap
from math import pi


class TestHeap(unittest.TestCase):
    def test_find_min_empty_heap(self):
        heap = Heap()
        self.assertEqual(None, heap.find_min())

    def test_find_min_single_element_heap(self):
        heap = Heap()
        heap.insert((10, "a"))
        self.assertEqual(heap.find_min(), (10, "a"))

    def test_find_min_multiple_elements_heap(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c", "test"))
        self.assertEqual(heap.find_min(), (5, "b"))

    def test_find_min_after_extract_min(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((-5, "b"))
        heap.insert((pi * 4, "c"))
        heap.extract_min()
        self.assertEqual(heap.find_min(), (10, "a"))

    def test_find_min_after_update(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.update((5, "b", 3))
        self.assertEqual(heap.find_min(), (5, "b"))

    def test_find_min_after_delete(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.delete("b")
        self.assertEqual(heap.find_min(), (10, "a"))

    def test_find_min_after_heapify(self):
        heap = Heap()
        heap.heapify([(10, "a"), (5.5, "b", ()), (15, "c")])
        self.assertEqual(heap.find_min(), (5.5, "b", ()))

    def test_find_min_after_insert_and_heapify(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.heapify([(pi, "b"), (15, "c")])
        self.assertEqual(heap.find_min(), (pi, "b"))

    def test_find_min_after_delete_and_heapify(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.delete("b")
        heap.heapify([(3, "d"), (12, "e")])
        self.assertEqual(heap.find_min(), (3, "d"))

    def test_find_min_after_update_and_heapify(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.update((5, "b", 3))
        heap.heapify([(12, "d"), (17, "e")])
        self.assertEqual(heap.find_min(), (12, "d"))

    def test_find_min_after_extract_min_and_heapify(self):
        heap = Heap()
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.extract_min()
        heap.heapify([(-12.3, "d", []), (17, "e")])
        self.assertEqual(heap.find_min(), (-12.3, "d", []))

    def test_find_min_after_multiple_operations(self):
        heap = Heap()
        heap.heapify([(-(pi), "d"), (17, "e")])
        heap.insert((10, "a"))
        heap.insert((5, "b"))
        heap.insert((15, "c"))
        heap.extract_min()
        heap.update((3, "a", 3))
        heap.delete("c")
        self.assertEqual(heap.find_min(), (3, "a", 3))


if __name__ == "__main__":
    unittest.main()
