package com.library.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.BookDao;
import com.library.service.BookService;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSFunction;

@WebServlet("*.book")
public class BookController extends HttpServlet{

	BookService bs = new BookService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println("get 요청 uri : " + uri);

		
		if(uri.indexOf("list") > 0) {
			System.out.println(uri.indexOf("list"));
			
			// 검색조건 세팅 
			Criteria cri = new Criteria(req.getParameter("searchField"),req.getParameter("searchWord"),req.getParameter("pageNo"));
			
			// 리스트 조회및 요청객체에 저장
			Map<String, Object> map = bs.getList(cri);
			req.setAttribute("map", map);
			
			// 포워딩
			req.getRequestDispatcher("../book/list.jsp").forward(req, resp);
			
		} else if(uri.indexOf("delete") > 0) {
//			bs.delete("delNo");
			System.out.println("2");
			int res = bs.delete(req.getParameter("delNo"));
			
			if(res>0) {
				req.setAttribute("message", res+"건 삭제되었습니다");
			} else {

				req.setAttribute("message", "삭제실패, 관리자에게 문의해주세요");
			}
			//포워딩
			req.getRequestDispatcher("./list.book").forward(req, resp);		
			
		} else if(uri.indexOf("view") > 0) { 
			System.out.println("view");
			System.out.println(uri.indexOf("view"));
			String no = req.getParameter("no");
			req.setAttribute("dto", bs.selectone(no));
			//resp.sendRedirect("view.jsp");
			req.getRequestDispatcher("view.jsp").forward(req, resp);	
			
		} else if(uri.indexOf("write") > 0) { 
			System.out.println("write");
			//resp.sendRedirect("write.jsp");
			req.getRequestDispatcher("write.jsp").forward(req, resp);
			
		} else if(uri.indexOf("user") > 0) { 
			System.out.println("user");

			req.getRequestDispatcher("userlist.jsp").forward(req, resp);
			
		} else if(uri.indexOf("rent") > 0) { 
			System.out.println("rent");
			HttpSession session = req.getSession();
			if(session.getAttribute("userid")==null) {
				JSFunction.alertBack(resp, "로그인 후 사용 가능");
				return;
			}
			
			Book book = new Book();
			book.setNo(req.getParameter("no"));
			book.setId(session.getAttribute("userId").toString());

			int res = bs.rentBook(book);
			System.out.println(res);
			if(res>0) {
				JSFunction.alertLocation(resp, "../view.book?no="+book.getNo(), "대여되었습니다");
			} else {
				JSFunction.alertBack(resp, "대여중 오류가 발생 하였습니다.");
			}
		}
		else {
			JSFunction.alertBack(resp, "doget url을 확인해주세요");
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println("post 요청 uri : " + uri);
		

		if(uri.indexOf("write") > 0) {
			System.out.println("5");
			String saveDirectory ="D:\\library0627\\webapp\\images\\bookimg";
			
			MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, 1024*1000);
			
			Book book = new Book(mr.getParameter("title"), mr.getParameter("author"));
			// 도서등록
				
				String ofile = mr.getFilesystemName("bookImg");
				
				if(ofile!=null && !ofile.equals("")) {
					String sfile = FileUtil.fileNameChange(saveDirectory, ofile);	
					book.setOfile(ofile);
					book.setSfile(sfile);
				}
				
				int res = bs.insert(book);
				
				if(res>0) {
					JSFunction.alertLocation(resp, "./list.book", "등록되었습니다");		
				} else {
					JSFunction.alertBack(resp, "등록중 예외사항이 발생하였습니다.");
					}
				} else if(uri.indexOf("view") > 0) { 
					System.out.println("15");
					String no = req.getParameter("no");
					req.setAttribute("dto", bs.selectone(no));
					//resp.sendRedirect("view.jsp");
					req.getRequestDispatcher("view.jsp").forward(req, resp);	
					
				}  else {
				JSFunction.alertBack(resp, "dopost url을 확인해주세요");
			}
		}
	
	
	public BookController() {
		// TODO Auto-generated constructor stub
	}

}
