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

<%@include file="IsLogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	// 입력값을 받아 dto 생성
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// 사용자가 로그아웃을 하지 않았더라도 일정시간이 경과되면 세션 제거
	String id = session.getAttribute("user_id").toString()==null?"":session.getAttribute("user_id").toString();

	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	// dao.inset 호출 : db에 글을 등록하고 결과를 숫자로 반환
	BoardDao dao = new BoardDao();
	int res = dao.insertBoard(board);

	// 등록 성공 : 리스트 페이지로 이동 
	// 등록 실패 메세지 처리
	if(res>0){
		JSFunction.alertLocation("게시글 등록", "List.jsp", out);
		

	} else{
		JSFunction.alertBack("등록 중 오류 발생", out);
		/*<script>
		alert("등록 중 오류 발생");
		history.go(-1);
		</script>*/
 	}
%>
</body>
</html>