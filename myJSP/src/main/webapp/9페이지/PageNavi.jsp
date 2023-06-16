<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- PageDto 객체를 가지고 페이지 블럭을 생성
	- 페이지블럭의 시작번호
	- 페이지블럭의 끝번호
	- 게시물의 끝 페이지 번호
	- 이전/다음 출력여부
 -->
<%

	// 총 게시물 수, 검색조건(페이지 번호, 페이지당 게시물 수, 검색어, 검색조건)
	int pageNo = request.getParameter("pageNo")==null?1:Integer.parseInt(request.getParameter("pageNo"));
	
	// totalCnt, pageNo를 세팅
	int totalCnt = 300;
	Criteria criteria = new Criteria(pageNo);
	PageDto pageDto = new PageDto(totalCnt, criteria);


	if(pageDto.isPrev()){
		// 시작페이지번호가 1보다 큰 경우 이전버튼을 출력
		// out.print("<a href='PageNavi.jsp?pageNo="+pageDto.getStartNo()+"'>");
		out.print("<a href='PageNavi.jsp?pageNo="+(pageDto.getStartNo()-1)+"'>");
		out.print('<');		
		out.print("  </a>");
		
	}
	for(int i = pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){
		out.print("<a href='PageNavi.jsp?pageNo="+i+"'>");
		out.print(i);
		out.print("  </a>");
	}
	if(pageDto.isNext()){
		// 마지막 번호가 게시물의 끝페이지 번호와 일치하지 않으면
		out.print("<a href='PageNavi.jsp?pageNo="+(pageDto.getEndNo()+1)+"'>");
		out.print(">");
		out.print("  </a>");
	}
		
%>
</body>
</html>