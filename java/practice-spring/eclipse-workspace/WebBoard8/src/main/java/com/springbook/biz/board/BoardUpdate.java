package com.springbook.biz.board;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class BoardUpdate {
	

	public void UpdateBoard() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAProject2");
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();
		tx.begin();

		try {
			// ID 값이 1?�� Agent SELECT
			
			Board findBoard = em.find(Board.class,1);
			System.out.println(findBoard.toString());
			
			// ?��름을 Hello �? ?��?��
			findBoard.setName("Hello");

			// ?��?��?��?�� 커밋!
			tx.commit();
			System.out.println("check commit");
		} catch (Exception e) {
			tx.rollback();
			System.out.println("check rollback");
		} finally {
			em.close();
		}
		emf.close();
	}
}