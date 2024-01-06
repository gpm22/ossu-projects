import java.util.Map;
import java.util.HashMap;
import java.util.Collection;

public class UnionFind<T> {
    private Map<T, Node<T>> nodes;
    private int numberOfRoots;

    public UnionFind(T[] elements) {
        nodes = new HashMap<>();
        for (T element : elements) {
            nodes.put(element, new Node<T>(element, null, 1));
        }
        numberOfRoots = nodes.size();
    }

    public UnionFind(Collection<T> elements) {
        nodes = new HashMap<>();
        for (T element : elements) {
            nodes.put(element, new Node<T>(element, null, 1));
        }
        numberOfRoots = nodes.size();
    }

    public T find(T element) {
        Node<T> node = nodes.get(element);
        return node.isRoot() ? node.getValue() : find(node.getParent().getValue());
    }

    public UnionFind<T> union(T firstElement, T secondElement) {
        Node<T> firstRoot = nodes.get(find(firstElement));
        Node<T> secondRoot = nodes.get(find(secondElement));

        if (firstRoot == secondRoot) {
            return this;
        }

        if (firstRoot.getSize() < secondRoot.getSize()) {
            firstRoot.setParent(secondRoot);
            secondRoot.setSize(secondRoot.getSize() + firstRoot.getSize());
        } else {
            secondRoot.setParent(firstRoot);
            firstRoot.setSize(firstRoot.getSize() + secondRoot.getSize());
        }
        numberOfRoots--;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Node<T> node : nodes.values()) {
            sb.append(node.toString() + " - root: " + find(node.getValue()).toString() + "\n");
        }
        return sb.toString();
    }

    private static class Node<T> {
        private T value;
        private Node<T> parent;
        private int size;

        public Node(T value, Node<T> parent, int size) {
            this.value = value;
            this.parent = parent;
            this.size = size;
        }

        public boolean isRoot() {
            return parent == null;
        }

        public T getValue() {
            return value;
        }

        public Node<T> getParent() {
            return parent;
        }

        public int getSize() {
            return size;
        }

        public void setParent(Node<T> parent) {
            this.parent = parent;
        }

        public void setSize(int size) {
            this.size = size;
        }

        @Override
        public String toString() {
            return "Node: " + value + " - parent: " + (parent == null ? "self" : parent.getValue()) + " - size: " + size;
        }
    }
}
