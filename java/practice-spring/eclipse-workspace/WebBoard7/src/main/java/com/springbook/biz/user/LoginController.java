package com.springbook.biz.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.user.impl.UserDAO;
import com.springbook.biz.vo.UserVO;




@Controller
public class LoginController {
	
	@RequestMapping(value="/login.do")
	public ModelAndView loging(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("login");

		
		//1.������Է�ó��
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		//2 . db����ó��
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		
		UserDAO userdao = new UserDAO();
		UserVO  user = userdao.read(vo);
		
		//3. ȭ��׺���̼�
	
		ModelAndView mv = new ModelAndView();
		
		if(user!=null) {
			mv.setViewName("home.jsp");
			
		}else {
			mv.setViewName("login.jsp");

		}
		return mv;
	
	}

}
