<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
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
	String num = request.getParameter("num");
	NewBoardDao dao = new NewBoardDao();
	int res = dao.deleteBoard(num);
	if(res>0){
		JSFunction.alertLocation("삭제 성공", "List.jsp", out);
	} else{
		JSFunction.alertBack("삭제 실패", out);
	}
%>

</body>
</html>