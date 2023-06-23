package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;


@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MVCBoardDao dao = new MVCBoardDao();
		MVCBoardDto dto = dao.selectOne(Integer.parseInt(req.getParameter("idx")));
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("../14MVCBoard/View.jsp").forward(req, resp);
	}
	
	public ViewController() {

	}

}
