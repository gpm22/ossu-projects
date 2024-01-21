class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.left = None
        self.right = None
        self.parent = None

    def __repr__(self):
        return f'{self.key}: {self.value}'

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, key, value):
        if self.root is None:
            self.root = Node(key, value)
            return

        node = self.root
        while True:
            if key < node.key:
                if node.left is None:
                    node.left = Node(key, value)
                    node.left.parent = node
                    return
                else:
                    node = node.left
            elif key > node.key:
                if node.right is None:
                    node.right = Node(key, value)
                    node.right.parent = node
                    return
                else:
                    node = node.right
            else:
                node.value = value
                return

    def search(self, key):
        result = self.__search(key)
        if result is None:
            return None
        
        return result.value        

    def in_order(self):
        if self.root is None:
            return

        def traverse(node):
            if node is not None:
                traverse(node.left)
                print(node.value, end=' ')
                traverse(node.right)

        traverse(self.root)

    def pre_order(self):
        if self.root is None:
            return

        def traverse(node):
            if node is not None:
                print(node.value, end=' ')
                traverse(node.left)
                traverse(node.right)

        traverse(self.root)

    def post_order(self):
        if self.root is None:
            return

        def traverse(node):
            if node is not None:
                traverse(node.left)
                traverse(node.right)
                print(node.value, end=' ')

        traverse(self.root)

    def remove(self, key):
        node = self.__search(key)
        if node is None:
            return None

        if node.left is None and node.right is None:  # node has no children
            self._remove_leaf_node(node)
        elif node.left is None:  # node has only right child
            self._remove_right_child_node(node)
        elif node.right is None:  # node has only left child
            self._remove_left_child_node(node)
        else:  # node has two children
            successor = self._find_successor(node)
            self._replace_node_with_successor(node, successor)

        return node.value
        
    def __search(self, key):
        if self.root is None:
            return None

        node = self.root
        while node is not None:
            if key < node.key:
                node = node.left
            elif key > node.key:
                node = node.right
            else:
                return node
        return None

    def _remove_leaf_node(self, node):
        if node.parent is None:  # node is root
            self.root = None
        else:
            if node.parent.left == node:
                node.parent.left = None
            else:
                node.parent.right = None

    def _remove_right_child_node(self, node):
        if node.parent is None:  # node is root
            self.root = node.right
        else:
            if node.parent.left == node:
                node.parent.left = node.right
            else:
                node.parent.right = node.right
            node.right.parent = node.parent

    def _remove_left_child_node(self, node):
        if node.parent is None:  # node is root
            self.root = node.left
        else:
            if node.parent.left == node:
                node.parent.left = node.left
            else:
                node.parent.right = node.left
            node.left.parent = node.parent

    def _find_successor(self, node):
        successor = node.right
        while successor.left is not None:
            successor = successor.left
        return successor

    def _replace_node_with_successor(self, node, successor):
        
        
        if successor.parent.left == successor:
            successor.parent.left = None
        else:
            successor.parent.right = None
            
        if node.parent is None:  # node is root
            self.root = successor
            successor.parent = None
        else:
            successor.parent = node.parent
            if node.parent.left == node:
                node.parent.left = successor
            else:
                node.parent.right = successor

        successor.left = node.left
        successor.right = node.right
        

if __name__ == '__main__':
    tree = BinarySearchTree()
    tree.insert(10, 'ten')
    tree.insert(6, 'six')
    tree.insert(15, 'fifteen')
    tree.insert(3, 'three')
    tree.insert(8, 'eight')
    tree.insert(12, 'twelve')
    tree.insert(16, 'sixteen')

    print('In-order traversal:')
    tree.in_order()
    print()

    print('Pre-order traversal:')
    tree.pre_order()
    print()

    print('Post-order traversal:')
    tree.post_order()
    print()

    print('Searching for 10:', tree.search(10))
    print('Searching for 20:', tree.search(20))
    
    print('Removing 10:', tree.remove(10))
    print('Removing 20:', tree.remove(20))
    print('Removing 12:', tree.remove(12))
    print('Removing 8:', tree.remove(8))
    
    print('In-order traversal:')
    tree.in_order()
