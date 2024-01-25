import unittest
from BinarySearchTree import BinarySearchTree

class TestBSTRemove(unittest.TestCase):

    def setUp(self) -> None:
        self.bst = BinarySearchTree()

    def test_remove_leaf_node(self) -> None:
        
        self.bst.insert(5, "A")
        self.bst.insert(3, "B")
        self.bst.insert(7, "C")

        self.assertEqual(self.bst.remove(7), "C")
        self.assertIsNone(self.bst.search(7))
        self.assertEqual(self.bst.root.key, 5)
        self.assertIsNone(self.bst.root.right)

    def test_remove_node_with_one_right_child(self) -> None:
        
        self.bst.insert(5, "A")
        self.bst.insert(3, "B")
        self.bst.insert(8, "C")

        self.assertEqual(self.bst.remove(3), "B")
        self.assertIsNone(self.bst.search(3))
        self.assertEqual(self.bst.root.right.key, 8)

    def test_remove_node_with_one_left_child(self) -> None:
        
        self.bst.insert(5, "A")
        self.bst.insert(2, "B")
        self.bst.insert(7, "C")

        self.assertEqual(self.bst.remove(7), "C")
        self.assertIsNone(self.bst.search(7))
        self.assertEqual(self.bst.root.left.key, 2)

    def test_remove_node_with_two_children(self) -> None:
        
        self.bst.insert(5, "A")
        self.bst.insert(3, "B")
        self.bst.insert(7, "C")
        self.bst.insert(2, "D")
        self.bst.insert(4, "E")

        self.assertEqual(self.bst.remove(3), "B")
        self.assertIsNone(self.bst.search(3))
        self.assertEqual(self.bst.root.left.key, 4)  # Successor (4) replaced removed node
        self.assertEqual(self.bst.root.left.left.key, 2)
        self.assertIsNone(self.bst.root.left.right)

    def test_remove_root_node(self) -> None:
        
        self.bst.insert(5, "A")

        self.assertEqual(self.bst.remove(5), "A")
        self.assertIsNone(self.bst.root)

    def test_remove_nonexistent_key(self) -> None:
        
        self.bst.insert(5, "A")
        self.bst.insert(3, "B")

        self.assertIsNone(self.bst.remove(8))  # Key not found
        self.assertEqual(self.bst.root.key, 5)
        self.assertEqual(self.bst.root.left.key, 3)
        
    def test_remove_leaf_node(self) -> None:
        
        self.bst.insert(5, 'A')
        self.bst.insert(3, 'B')
        self.bst.insert(7.2, 'C')

        self.assertEqual(self.bst.remove(7.2), 'C')
        self.assertIsNone(self.bst.search(7.2))

    def test_remove_node_with_one_child(self) -> None:
        
        self.bst.insert(8, 'A')
        self.bst.insert(-5, 'B')
        self.bst.insert(3, 'C')
        self.bst.insert(10, 'D')

        self.assertEqual(self.bst.remove(-5), 'B')  # Remove node with right child
        self.assertIsNone(self.bst.search(-5))
        self.assertIsNone(self.bst._BinarySearchTree__search(3).right)

        self.bst.remove(10)  # Remove node with left child
        self.assertIsNone(self.bst.search(10))
        self.assertIsNone(self.bst._BinarySearchTree__search(8).right)

    def test_remove_node_with_two_children(self) -> None:
        
        self.bst.insert(10, 'A')
        self.bst.insert(-5, 'B')
        self.bst.insert(15, 'C')
        self.bst.insert(3, 'D')
        self.bst.insert(8, 'E')
        self.bst.insert(12, 'F')

        self.assertEqual(self.bst.remove(10), 'A')
        self.assertIsNone(self.bst.search(10))
        self.assertEqual(self.bst.root.key, 12)  # Successor should have taken the place

    def test_remove_root(self) -> None:
        
        self.bst.insert(5, 'A')
        self.assertEqual(self.bst.remove(5), 'A')
        self.assertIsNone(self.bst.root)

    def test_remove_nonexistent_key(self) -> None:
        
        self.bst.insert(1, 'A')
        self.assertIsNone(self.bst.remove(2))

    def test_remove_from_empty_tree(self) -> None:
        
        self.assertIsNone(self.bst.remove(5))   # Tree is empty
        
    def test_remove_root_from_tree_with_right_side_larger(self) -> None:
        
        self.bst.insert(4, '4')
        self.bst.insert(3, '3')
        self.bst.insert(8, '8')
        self.bst.insert(6, '6')
        self.bst.insert(7, '7')
        self.bst.insert(12.5, '12.5')
        self.bst.insert(9, '9')
        self.bst.insert(11, '11')

        self.assertEqual(self.bst.remove(4), '4')
        self.assertEqual(self.bst.root.key, 6)
        self.assertEqual(self.bst._BinarySearchTree__search(8).left.key, 7)
        self.assertEqual(self.bst._BinarySearchTree__search(8).right.key, 12.5)
 
        self.assertEqual(self.bst.remove(8), '8')
        self.assertEqual(self.bst._BinarySearchTree__search(12.5).left.key, 11)
        self.assertEqual(self.bst._BinarySearchTree__search(9).right.key, 12.5)
        self.assertEqual(self.bst._BinarySearchTree__search(9).left.key, 7)
        
    def test_remove_root_from_tree_with_left_side_larger(self) -> None:

        self.bst.insert(10, '10')
        self.bst.insert(12, '12')
        self.bst.insert(4., '4')
        self.bst.insert(3, '3')
        self.bst.insert(6.1, '6.1')
        self.bst.insert(5., '5')
        
        self.assertEqual(self.bst.remove(4), '4')
        self.assertEqual(self.bst._BinarySearchTree__search(5).right.key, 6.1)
        self.assertEqual(self.bst._BinarySearchTree__search(5).left.key, 3)
    
    def test_with_wrong_type(self) -> None:
        self.bst.insert(10., '10')
        self.bst.insert(12, '12')
        self.bst.insert(4, '4')
        self.bst.insert(3., '3')
        self.bst.insert(6, '6')
        self.bst.insert(5, '5')
        
        with self.assertRaises(TypeError):
            self.bst.remove("ten")
            

        with self.assertRaises(TypeError):
            self.bst.remove(10j)

if __name__ == '__main__':
    unittest.main()
