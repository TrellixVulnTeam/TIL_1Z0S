package test02;


// Ʈ���� �������̽�
public interface Tree<T>{
	
	public void insert(T data);
	public T getMinValue();
	public T getMaxValue();
	//��ȸ
	public void traversal();
	public void delete(T data);

}
