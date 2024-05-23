import unittest
from numbers import Real
from merge_sort import merge_sort

class TestMergeSort(unittest.TestCase):
    
    def test_sorted_list(self) -> None: 
        self.assertEqual(merge_sort(list(range(1, 6))), [1, 2, 3, 4, 5])  
        
    def test_even_list(self) -> None:
        self.assertEqual(merge_sort([5.99, 4, 3, -2.2, -1, 12]), [-2.2, -1, 3, 4, 5.99, 12])
        self.assertEqual(merge_sort(list(range(10)) + list(range(11, -1, -1))),
                         [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 11]) 
    
    def test_odd_list(self) -> None:
        self.assertEqual(merge_sort([5, 4, 13, 2, -12.45]), [-12.45, 2, 4, 5, 13])
        self.assertEqual(merge_sort(list(range(13)) + list(range(13, -1, -1))),
                         [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13])
                         
    def test_sorted_in_reverse_order(self) -> None:
        self.assertEqual(merge_sort([12.0, 3.3, 1]), [1, 3.3, 12.0])
        self.assertEqual(merge_sort(list(range(12, -1, -1))), list(range(13)))
        
    def test_duplicates(self) -> None:
        self.assertEqual(merge_sort([4, 2, 4, 1, 6, 4]), [1, 2, 4, 4, 4, 6])
        self.assertEqual(merge_sort([-4.2, 2, -4.2, 1, 6, -4.2]), [-4.2, -4.2, -4.2, 1, 2, 6])
        self.assertEqual(merge_sort(list(range(12))+list(range(12))),
                         [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11])
    
    def test_empty(self) -> None:
        self.assertEqual(merge_sort([]), [])
        
    def test_one_element(self) -> None:
        self.assertEqual(merge_sort([5]), [5])
        self.assertEqual(merge_sort([-12]), [-12])
        self.assertEqual(merge_sort([33.33333]), [33.33333])
        
    def test_invalid_input(self) -> None:
        with self.assertRaises(TypeError):
            merge_sort(5)
        with self.assertRaises(TypeError):
            merge_sort((12, 14, 15, 16))
        with self.assertRaises(TypeError):
            merge_sort("asasas")
        with self.assertRaises(TypeError):
            merge_sort(["a","s","asas"])
        with self.assertRaises(TypeError):
            merge_sort({0:10, "asas":12})
        with self.assertRaises(TypeError):
            merge_sort(None)
        with self.assertRaises(TypeError):
            merge_sort(True)
        with self.assertRaises(TypeError):
            merge_sort([4+1j, 2+0j, 4-2j, 1, 6, 4])
        with self.assertRaises(TypeError):
            merge_sort([3.01j, 1j, 12j, 2j, -12.45j])
        with self.assertRaises(TypeError):
            merge_sort([4j, 2j, 4j, 1j, 6j, 4j])
            
if __name__ == '__main__':
    unittest.main()
