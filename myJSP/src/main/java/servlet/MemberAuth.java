package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.MemberDao;
import dto.Member;

public class MemberAuth extends HttpServlet{

	MemberDao dao;
	
	
	@Override
	public void init() throws ServletException {
		dao = new MemberDao();
	}
	
	
	//405오류 : 메서드를 찾지 못할 때 발생하는 오류
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		Member member = dao.login(id, pw);
		
		if(member!=null) {
			req.setAttribute("authMessage", member.getName()+"님 반갑습니다~!");
			
			if(member.getId().equals(admin_id)){
				req.setAttribute("authMessage", admin_id+"님은 관리자입니다.");
			}
		} else {
			req.setAttribute("authMessage", "로그인 실패");
		}
		req.getRequestDispatcher("/13서블릿/MemberAuth.jsp").forward(req, resp);
		
		//resp.sendRedirect("/13서블릿/MemberAuth.jsp");
	}
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
