package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

@WebServlet()
public class ListController extends HttpServlet{
	
	//list니깐 get메서드?
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 리스트 조회
		MVCBoardDao dao = new MVCBoardDao();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		
		int pageNo = 1;
		if(req.getParameter("pageNo")!=null) {
			try {
				pageNo = Integer.parseInt(req.getParameter("pageNo")); 			
			} catch(Exception e) {
				System.out.println("페이지 번호를 숫자로 변환 중 오류 발생");
				System.out.println("pageNo : " +  req.getParameter("pageNo").toString());
				pageNo=1;
			}
		}
		// 검색어, 페이지정보 세팅
		Criteria cri = new Criteria(searchField, searchWord, pageNo);
		
		
		// 검색어 페이지 정보를 담은 객체를 매개변수로 넣어줍니다
		List<MVCBoardDto> list = dao.getListPage(cri);

		int count = dao.getTotalCnt(cri);	
		PageDto pageDto = new PageDto(count, cri);
		
		// request영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		req.setAttribute("pageDto", pageDto);
		
		searchWord = searchWord == null? "" : searchWord;

		// 화면페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp?pageNo=pageNo").forward(req, resp);

	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
