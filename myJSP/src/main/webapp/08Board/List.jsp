<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../6세션/Link.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th, td{
height: 30px;
text-align: center;
}
#writer{
float: right;
}
</style>
</head>
<body>
<%
BoardDao dao = new BoardDao();
List<Board> list = dao.getList();
int count = dao.getTotalCount();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
//검색어가 null이 아니면 검색 기능을 추가!
out.print(searchField);
out.print(searchWord);


%>
<h2>목록보기(list)</h2>
총 건수 : <%=count %>
<form>
<table border=1 width="90%">
<tr>
<td>
<select name='searchField'>
        <option value="제목">제목</option>
        <option value="내용">내용</option>
</select>
<input id="blank" name="searchWord" value=<%=searchWord%>>
<button id="submit">검색하기</button>
</td>
</tr>
</table>
</form>
<table border=1 width="90%">
<tr>
<th width=50px>번호</th>
<th width=200px>제목</th>
<th width=80px >작성자</th>
<th width=50px>조회수</th>
<th width=200px>작성일</th>
</tr>
<%
if(list.isEmpty()){
%>
<tr>
	<td colspan="5" align="center">등록된 게시물이 없습니다</td>	
</tr>

<% } 
for(Board board : list) {
%>	
<tr>
<td><%=board.getNum()%></td>
<td><%=board.getTitle()%></td>
<td><%=board.getId()%></td>
<td><%=board.getVisitcount()%></td>
<td><%=board.getPostDate()%></td>
</tr>
<%}%>
<tr>
<td colspan=5>
<button id="writer">글쓰기</button>
</td>
</tr>


</table>
</body>
</html>