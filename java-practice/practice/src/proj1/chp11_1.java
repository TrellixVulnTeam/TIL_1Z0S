package proj1;

import java.util.ArrayList;

// List interface
public class chp11_1 {

	
	
	// �ߺ��� ����ϰ�, ����� ������ �����ȴ�
	public static void main(String[] args) {
		// 1. ����� ����
		ArrayList<Integer> arr1 = new ArrayList<Integer>();
		ArrayList<Integer> arr2 = new ArrayList<Integer>();
		// 2. add
		for(int i=0;i<10;i++) {
			arr1.add(i*3);
			arr2.add(i*3-1);
		}
		System.out.println(arr1);
		
		// 2-1 addAll
		
		
		// arr3�� arr1+arr2�� ����� �ʹ� �̋�, addall�� arr��ü�� �߰��� �� �ְ� �Ѵ�
		
		ArrayList<Integer> arr3 = new ArrayList<Integer>(arr1);
		arr3.addAll(arr2);
		System.out.println(arr3);
		
		int limit =  arr2.size();
		for(int i=0;i<limit;i++) {
			int elem = arr2.get(i); // �ش� index�� ����� ��ü�� ��ȯ�Ѵ�
			arr2.set(i,elem+2 ); // �ش� index�� ��ü�� �������ִ� ����

		}
		
		ArrayList<Integer> arr4=new ArrayList<Integer>(arr2.subList(10,13));
		System.out.println(arr4);
		
		// sort�� ���
//		arr4.sort();
		
		
	}

}
