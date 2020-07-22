package tree01;

public class test01 {

	public static void main(String[] args) {
		
		Node root = new Node('A');
		Node B = new Node('B');
		Node C = new Node('C');
		Node D = new Node('D');
		Node E = new Node('E');
		Node F = new Node('F');
		Node G = new Node('G');
		
		Tree.add(root, B);
		Tree.add(root, C);
		Tree.add(B, D);
		Tree.add(B, E);
		Tree.add(C, F);
		Tree.add(C, G);
		Tree.printTree(root, 3);
		
	}

}

class Tree {

	public static void add(Node parent, Node child) {
		// �θ� ����� �ڽ� ��尡 ���ٸ�
		if (parent.getLeftChild() == null)
			parent.setLeftChild(child);
		// �θ� ����� �ڽ� ��尡 �ִٸ�
		else {
			// �ڽ� ����� ������ ���� �߰�
			Node temp = parent.getLeftChild();
			while (temp.getRightSibling() != null)
				temp = temp.getRightSibling(); 

			temp.setRightSibling(child);
		}
	}

	public static void printLevel(Node node, int level) {
		int depth = 0;
		Node tempChild = node;
		Node tempParent = node;

		
		while (depth <= level) {
			if (depth == level) {
				// �ش� ������ ��尡 �����Ѵٸ�
				while (tempChild != null) {
					// �����͸� ����ϰ� �������� �̵��Ѵ�.
					System.out.print(tempChild.getData() + " ");
					tempChild = tempChild.getRightSibling();
				}

				// �θ� ����� ������尡 �����Ѵٸ�
				// �� ����� �ڽ� ���鵵 �������� �Ѵ�.
				if (tempParent.getRightSibling() != null) {
					tempParent = tempParent.getRightSibling();
					tempChild = tempParent.getLeftChild();
				} else
					break;
			} else {
				// ���̿� ������ ���� ������ �θ� ��带 �����ϰ�
				// �Ѵܰ� �Ʒ��� ��������.
				tempParent = tempChild;
				tempChild = tempChild.getLeftChild();
				depth++;
			}
		}
	}

	// ��� ���
	public static void printTree(Node node, int depth) {
		for (int i = 0; i < depth; i++)
			System.out.print(" ");

		// ������ ���
		System.out.println(node.getData());

		// �ڽ� ��尡 �����Ѵٸ�
		if (node.getLeftChild() != null)
			printTree(node.getLeftChild(), depth + 1);

		// ���� ��尡 �����Ѵٸ�
		if (node.getRightSibling() != null)
			printTree(node.getRightSibling(), depth);
	}
}