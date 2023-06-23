package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;

@WebServlet
public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
		//resp.sendRedirect("../14MVCBoard/Write.jsp");

	}
	
	public WriteController() {
		// TODO Auto-generated constructor stub
	}

}
