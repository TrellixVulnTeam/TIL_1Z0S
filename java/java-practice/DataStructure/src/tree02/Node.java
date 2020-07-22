package tree02;

public class Node {
	int data;
	Node left;
	Node right;

	public Node() {

	}

}

class Tree {

	Node root;

	public Node getRoot() {
		return root;
	}

	public void setRoot(Node root) {
		this.root = root;
	}

	// node�� �����԰� ���ÿ� left ,right�� �������ش�
	public Node createNode(int data, Node left, Node right) {
		Node node = new Node();
		node.data = data;
		node.left = left;
		node.right = right;
		return node;
	}

	// ���� ��ȸ
	// inorder = left -> root -> right
	public void inOrder(Node node) {
		if (node != null) {
			inOrder(node.left);
			System.out.println(node.data);
			inOrder(node.right);
		}
	}

	// root->left->right
	public void preOrder(Node node) {
		if (node != null) {
			System.out.println(node.data);
			preOrder(node.left);
			preOrder(node.right);

		}

	}

	// left->right->root
	public void postOrder(Node node) {
		if (node != null) {
			postOrder(node.left);
			postOrder(node.right);
			System.out.println(node.data);
		}
	}
}

class Queue {
	private Node[] q;
	private int rear;
	private int front;

	public Queue(int n) {
		q = new Node[n];
		rear = -1;
		front = -1;
	}

	public boolean isEmpty() {
		if (front == rear) {
			return true;
		} else {
			return false;
		}

	}
	
	public void enqueue(Node data) {
		
		if(rear==q.length-1) {
			System.out.println("que full");
			return;
		}else {
			rear = rear +1; //rear�� ����
			q[rear] = data; // rear ��ġ�� item ����
			
		}
	}
	
	public Node dequeue() {
		if(isEmpty()) {
			System.out.println("que empty");
			return null;
		}else {
			front = front+1;
			return q[front];
			
		}
			
	}
	
	static public void levelorder(Node node) {
		Queue que = new Queue(10);
		que.enqueue(node); // ť�� �ش� ��Ʈ ��带 �����Ѵ�
		Node n;
		
		while(!que.isEmpty()) {
			n = que.dequeue(); // n�� ť�� ���� ���� ���� node�̴�
			if(n!=null) {
				System.out.println(n.data);
				que.enqueue(n.left);
				que.enqueue(n.right);
			
			}
			
			
		}
		
		
		
	}

}
