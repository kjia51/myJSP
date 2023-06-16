<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Board board = new Board();
	NewBoardDao dao = new NewBoardDao();
	
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));	
	board.setId(session.getAttribute("user_id").toString());
	int res = dao.insertBoard(board);
	if(res>0){
		JSFunction.alertLocation("작성성공", "List.jsp", out);
	} else {
		JSFunction.alertBack("작성실패", out);
	}
%>
</body>
</html>