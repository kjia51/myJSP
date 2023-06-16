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
//한글 깨짐 방지
//request.setCharacterEncoding("utf-8");

//파라메터 dto 객체 생성
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");


Board board = new Board(num, title, content, "", "", "");

//게시물 업데이트
BoardDao dao = new BoardDao();
int res = dao.update(board);

out.print(res);
if(res>0){
	// 성공 : 메세지 출력 상세페이지로
	out.print(num);
	JSFunction.alertLocation("성공적으로 수정되었습니다.", "View.jsp?num= " + num, out);
}else{
	// 실패  : 메세지 출력  이전 페이지 
	JSFunction.alertBack("수정 도중 오류가 발생했습니다.", out);
}
%>
</body>
</html>