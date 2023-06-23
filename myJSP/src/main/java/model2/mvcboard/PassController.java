package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import common.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{
	
	public PassController() {
		// TODO Auto-generated constructor stub
	}

	private void sevice() {
		// TODO Auto-generated method stub

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		
		req.setAttribute("mode", mode);
		req.setAttribute("idx", idx);
		if(!"".equals(idx) && "edit".equals(mode)) {
			
		} else if(!"".equals(idx) && "delete".equals(mode)) {
			
		}
		
		req.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
	
		MVCBoardDao dao = new MVCBoardDao();
		
		boolean confirmed = dao.confirmPw(pass, idx);
		
		//비밀번호 체크 성공
		if(confirmed) {
			System.out.println("비밀번호 검증 성공");
			int res = dao.delete(idx);
			System.out.println(res);
				if(mode.equals("edit")) {
					//req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
					resp.sendRedirect("../mvcboard/edit.do?idx="+idx);
				} else if(mode.equals("delete")) {
					if(res>0) {
						// 삭제 성공
						JSFunction.alertLocation(resp, "../mvcboard/list.do", "삭제 성공했습니다");
					} else {
	//					삭제 실패
						JSFunction.alertBack(resp, "게시물 삭제 실패");
					}
					
				} else {
					System.out.println("else");
				}
		} 
		
		else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패하였습니다");
		}
	}

}
