package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	//톰켓이 서블릿을 관리하고.. 서블릿은 httpServlet의 상속을 받은 객체
	@Override
	
	//메소드가 get인 경우 실행
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("message", "서블릿호출");
//		res.getWriter().print("서블릿 호출!");
//		
//		PrintWriter out = res.getWriter();
//		out.print("서블릿 호출!!");
		
		// request 영역이 공유가 안됨
		//res.sendRedirect("HelloServlet.jsp");
		
		// request 영역이 공유
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, res);
	}

	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
