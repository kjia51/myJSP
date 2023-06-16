<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#fifth{
text-align: center;
}
input[name='num']{
	visibility: hidden;
}

</style>
</head>
<%
String num = request.getParameter("num");
BoardDao dao = new BoardDao();
Board board = dao.selectOne(request.getParameter("num"));

%>

<body>
<jsp:include page="Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>

<form action="EditProcess.jsp" method="post">

<input type="text" value="<%=num%>" name="num">
<table border="1" width="90%">
<tr>
<td>제목</td>
<td><input type="text" name="title" value=<%=board.getTitle()%> style="width:90%;"></td>
</tr>
<tr>
<td>내용</td>
<td>
<textarea name="content" style="width:90%;" rows="15">
<%=board.getContent()%>
</textarea>
</td>
</tr>

<tr id="fifth">
<td colspan="2">
<button type="submit">수정하기</button>
<button type="reset" >초기화</button>
<input type="button" value="목록보기"  onclick="location.href='View.jsp?num=<%=num%>'">
</td>
</tr>
</table>
</form>
</body>
</html>