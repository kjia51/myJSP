
<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
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
</style>
<%
	BoardDao dao = new BoardDao(); 
	Board board = dao.selectOne(request.getParameter("num"));
	dao.update(request.getParameter("num"));
	request.getParameter("content");
	
	
	if(board==null){
		out.print("게시글 존재하지 않음");
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		//out.print("<script>");
		//out.print("alert('게시글이 존재하지 않습니다.')");
		//out.print("history.go(-1);");
		//out.print("</script>");
		return;
	} 	
%>
<script>
	function deletePost(){
		var res = confirm("삭제하시겠습니까?");
		if(res){
			location.href="DeleteProcess.jsp?num=<%=board.getNum()%>";
			
		}
	}

</script>
</head>
<body>
<jsp:include page="Link.jsp" />
<h2>회원제 게시판 - 상세보기 View</h2>
<form action="">
<table border="1" width="90%">
<tr>
<td>번호</td>
<td><%=board.getNum() %></td>
<td>작성자</td>
<td><%=board.getId()%></td>
</tr>
<tr>
<td>작성일</td>
<td><%=board.getPostDate() %></td>
<td>조회수</td>
<td><%=board.getVisitcount() %></td>
</tr>
<tr>
<td>제목</td>
<td colspan="3"><%=board.getTitle()%></td>
</tr>
<tr>
<td>내용</td>
<td colspan="3"><%=board.getContent().replace("\r\n","<br/>") %></td>
</tr>
<tr id="fifth">
<td colspan="4" >
    <% 
    if(session.getAttribute("user_id")!=null && session.getAttribute("user_id").equals(board.getId())){
    %>
<input type="button" value="수정하기" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">
<input type="button" value="삭제하기" onclick="deletePost()">
<% }%>
<% 
	String pageNo = request.getParameter("pageNo")==null? "1" : request.getParameter("pageNo");
%>
<input type="button" value="목록보기" onclick="location.href='List.jsp?pageNo=<%=pageNo %>'">
</td>
</tr>
</table>
</form>

</body>
</html>