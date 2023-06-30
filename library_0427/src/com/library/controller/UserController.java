package com.library.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.UserService;
import com.library.vo.Criteria;

@WebServlet("*.user")
public class UserController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService us = new UserService();
		
		Criteria cri = new Criteria(req.getParameter("searchField"),req.getParameter("searchWord"),req.getParameter("pageNo"));
		
		Map<String, Object> usermap = us.getList(cri);
		req.setAttribute("usermap", usermap);
		req.getRequestDispatcher("../book/userlist.jsp").forward(req, resp);
	}
	
	public UserController() {
		
	}

}
