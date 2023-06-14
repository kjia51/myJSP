<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:include page="../6세션/Link.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<style>
#input{
	 text-align: center;
}
</style>
</head>
<body>
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form action="WriteProcess.jsp" >
<table border="1" width="90%">
<tr>
<td style="text-align: center;">제목</td>
<td><input name="title" style="width:95%" required></td>
</tr>
<tr>
<td style="text-align: center;">내용</td>
<td><textarea name="content" style="width:95%; height:200px;" required></textarea></td>
</tr>
<tr>
<td colspan="2" id="input">

<input type="submit" value="작성완료">

<input type="reset" value="다시전송">
<input type="button" value ="목록보기" onclick="location.href='view.jsp'"></td>
</tr>
</table>
</form>
</body>
</html>