package test01;

public class TreeNode {

	int data;
	TreeNode left;
	TreeNode right;

	
	// treenode��� ��ü�� �����ϴ� ���ÿ� �ϳ��� ���� left, right�� ���� �� �ֵ�
	public TreeNode() {
		this.left = null;
		this.right = null;
	}

	public TreeNode(int data) {
		super();
		this.data = data;
		this.left = null;
		this.right = null;
	}
	
	public int getData(){
        return data;
    }



}
