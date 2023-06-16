<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
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
	String num = request.getParameter("num");
	board.setNum(num);
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	//board.setId(session.getAttribute("user_id").toString());
	
	int res = dao.updateBoard(board);
	out.print(res);
	if(res>0){
		JSFunction.alertLocation("수정성공", "", out);
	} else{
		JSFunction.alertBack("수정실패", out);
	}
%>
</body>
</html>