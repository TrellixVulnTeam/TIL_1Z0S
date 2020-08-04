package com.springbook.biz.board;

import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.support.GenericApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		
		// 1. container ����
		GenericApplicationContext container = new GenericApplicationContext();
		new XmlBeanDefinitionReader(container).loadBeanDefinitions("applicationContext.xml");
		
		//2. spring�����̳ʷκ��� boardServiceImpl ��ü��  Lookup �Ѵ�
		
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		
		//3. �۵�� ��� �׽�Ʈ 
		boardService.insertboard();
		boardService.updateboard();
	
		boardService.deleteboard();
		
		

	}

}
