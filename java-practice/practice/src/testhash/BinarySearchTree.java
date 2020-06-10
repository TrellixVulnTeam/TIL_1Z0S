package test02;

public class BinarySearchTree<T extends Comparable<T>> implements Tree<T> {

	private Node<T> root; // root���

	@Override
	public void insert(T data) {
		if (root == null) {
			root = new Node<>(data);
		} else {
			insertNode(data, root);
		}

	}

	private void insertNode(T newdata, Node<T> node) {

		// ���ο� �����Ͱ� ������ �����ͺ��� ������
		if (newdata.compareTo(node.getData()) < 0) {
			// ���� �ش�position�� leftchild�� �����, ���ȣ���� ���� leftchild�� ���������� �� �Լ��� ȣ���ϰ� �ȴ�
			if (node.getLeftchild() != null) {
				insertNode(newdata, node.getLeftchild());
			} else {
				// leftchild�� ���� ��� ��带 �����ϰ�, �ȿ� �����͸� �ִ´�
				Node<T> newNode = new Node<T>(newdata);
				node.setLeftchild(newNode);
			}

		} else {
			if (node.getRightchild() != null) {
				insertNode(newdata, node.getRightchild());

			} else {
				Node<T> newNode = new Node<T>(newdata);
				node.setRightchild(newNode);

			}
		}

	}

	@Override
	public T getMinValue() {

		if (root == null) {
			return null;
		} else {
			return getMin(root);
		}

	}

	private T getMin(Node<T> node) {

		// ���� ���ʿ� ��ġ�� ��带 ã�������� ��� ȣ���̴�
		if (node.leftchild != null) {
			return getMin(node.leftchild);
		}
		return node.getData();

	}

	@Override
	public T getMaxValue() {

		if (root == null) {
			return null;
		}
		return getMax(root);

	}

	private T getMax(Node<T> node) {
		if (node.getRightchild() != null) {
			return getMax(node.getRightchild());
		}

		return node.data;
	}

	@Override
	public void traversal() {
		if(root!=null) {
		System.out.println("inorder�Դϴ�");
		inOrder(root);
		System.out.println("preorder");
		preOrder(root);
		System.out.println("postorder");
		postOrder(root);
	
		}
	}
		
    private void postOrder(Node<T> node) {
    	if(node.leftchild!=null) {
    		postOrder(node.leftchild);
    	}
    	if(node.rightchild!=null) {
    		preOrder(node.rightchild);
    	}
		System.out.println(node.data);
	}

	//root->left->right
	private void preOrder(Node<T> node) {
		System.out.println(node.data);
		if(node.leftchild!=null) {
			preOrder(node.leftchild);
		}
		if(node.rightchild!=null) {
			preOrder(node.rightchild);
		}
	}
	
	// left ->root->right
	private void inOrder(Node<T> node) {
		if(node.leftchild!=null) {
			inOrder(node.leftchild);
		}
		System.out.println(node.data);
		
		if(node.rightchild!=null) {
		inOrder(node.rightchild);
		}
	}
	
	

	@Override
	public void delete(T data) {
		if(root!=null) {
			root = delete(root,data);
		}
	}

	
	// �����Ϸ��� (Ȯ�ο� node, �����ϰ� ���� data)
	private Node<T> delete(Node<T> node, T data) {
//		if(node == null) {
			return node;
		}
		
//		// ������ �����Ͱ� ���� ����� ������ ���� ������?
//		
//		if(data.compareTo(node.getData())<0) {
//			node.setLeftchild(delete(node.getRightchild(),data));
//			
//		}else if(data.compareTo(node.getData())>0) {
//			node.setRightchild( delete(node.getLeftchild()),data);
//		}
//		
		
		
	}
	


