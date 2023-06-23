<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
<form>
<table border="1" width="90%" >
<tr>
<td style="width:100px;">작성자</td>
<td>
<input type="text">
</td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="10" cols="50"></textarea>
</tr>
<tr>
<td>첨부 파일</td>
<td></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text"></td>
</tr>
<tr style="text-align:center">
<td colspan="2">
<input type="button" value="작성완료">
<input type="button" value="RESET">
<input type="button" value="목록 바로가기">
</td>
</tr>
</table>
</form>
</body>
</html>