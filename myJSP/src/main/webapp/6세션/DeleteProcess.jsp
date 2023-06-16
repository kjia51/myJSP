<%@page import="common.JSFunction"%>
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
	String num = request.getParameter("num");
	BoardDao dao = new BoardDao();
	int res = dao.delete(num);

	if(res>0){
		// 성공 : 메세지 출력 상세페이지로
		JSFunction.alertLocation("성공적으로 삭제되었습니다", "List.jsp", out);
	}else{
		// 실패  : 메세지 출력  이전 페이지 
		JSFunction.alertBack("삭제 도중 오류가 발생하였습니다", out);
	}
%>
</body>
</html>