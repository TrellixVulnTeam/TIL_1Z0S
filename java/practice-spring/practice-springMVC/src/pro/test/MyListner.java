package pro.test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyListner implements ServletContextListener {

	
    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("context�� �ı�Ǿ����ϴ�");
         
    }

	
    public void contextInitialized(ServletContextEvent sce)  { 
       System.out.println("context�� �ʱ�ȭ�Ǿ����ϴ�");
       sce.getServletContext().setAttribute("name", "practice");
    }
	
}
