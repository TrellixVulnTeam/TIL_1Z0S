package com.springbook.biz.board;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class BoardInsert {
	
	public void InsertBoard() {
	     System.out.println( "Hello Insert World!" );
	        
	     
	        //entityManager
	        
	         EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAProject2");

	         EntityManager em = emf.createEntityManager();
	         
	         //Transaction ?��?��
	         
	         EntityTransaction tx= em.getTransaction();
	         tx.begin();
	         try{
	        	 System.out.println("check in insertboard");
	             Board board = new Board();
	             // ID?�� ?��?�� ?��?��?��?���? ?��?���?�? ?��름만 SET ?��본다.
	             board.setName("henniezz1213");
	  
	             
	             // ?��?��?��
	             em.persist(board);
	  
	             //?��?��?��?�� 커밋!
	             tx.commit();
	        	 System.out.println("check commit in insertBoard");
	             
	         }catch(Exception e){
	             tx.rollback();
	             System.out.println("check in insertboard rollback");
	         }finally{
	             em.close();
	         }
	         emf.close();
	}

}
