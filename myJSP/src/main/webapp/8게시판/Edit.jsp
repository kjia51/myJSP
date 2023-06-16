<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<style>
textarea{
padding: 0px;
}
</style>
<%
String num = request.getParameter("num");
NewBoardDao dao = new NewBoardDao();
Board board = dao.SelectOne(num);
%>
</head>
<body>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form action="EditProcess.jsp">
<input text="text" value="<%=num%>" name="num">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" value=<%=board.getTitle()%> style="width: 90%;"/> 
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td text-align="left">
                <textarea name="content" style="width: 90%; height: 100px; text-align:left;" >
                <%=board.getContent().replace("\r\n","<br>")%>
                </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp'">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>