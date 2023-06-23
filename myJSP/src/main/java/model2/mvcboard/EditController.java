package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		MVCBoardDao dao = new MVCBoardDao();
		MVCBoardDto dto =  dao.selectOne(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
		
		
	}
	
	public EditController() {
		// TODO Auto-generated constructor stub
	}

}
