<%@page import="dto.Criteria"%>
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
input[type='text']{
	visibility: hidden;
}
.active{
	color:red;
	font-size: 1.5em;
	font-weight: bold;
}


</style>
</head>
<body>
<%
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
String pageNo = request.getParameter("pageNo");

searchWord = searchWord == null? "" : searchWord;

Criteria criteria = new Criteria(searchField, searchWord, pageNo);

BoardDao dao = new BoardDao();
List<Board> list = dao.getListPage(criteria);
int count = dao.getTotalCount(criteria);



//검색어가 null이 아니면 검색 기능을 추가!
//out.print("검색어 : " + searchField+"<br>");
//out.print("검색필드  : " + searchWord);


%>
<h2>목록보기(list)</h2>
총 건수 : <%=count%>
<form name='searchForm'>
<input type='text' name='pageNo' value='<%=criteria.getPageNo()%>'>
<table border=1 width="90%">
<tr>
<td>
<select name='searchField'>
        <option value="">선택</option>
        <option value="num" <% if("num".equals(searchField)){%>selected="selected"<%}%>>일련번호</option>
        <option value="title" <% if("title".equals(searchField)){%>selected="selected"<%}%>>제목</option>
        <option value="content" <% if("content".equals(searchField)){%>selected="selected"<%}%>>내용</option>
        <option value="id" <% if("id".equals(searchField)){%>selected="selected"<%}%>>작성자 아이디</option>
        <option value="postdate" <% if("postdate".equals(searchField)){%>selected="selected"<%}%>>작성일</option>
        <option value="visitcount" <% if("visitcount".equals(searchField)){%>selected="selected"<%}%>>조회수</option>
</select>
<input id="blank" name="searchWord" value=<%=searchWord%>>
<button id="submit">검색하기</button>

</td>
</tr>
</table>

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
<td><a href="View.jsp?num=<%=board.getNum()%>&pageNo=<%=criteria.getPageNo()%>"><%=board.getTitle()%></a></td>
<td><%=board.getId()%></td>
<td><%=board.getVisitcount()%></td>
<td><%=board.getPostDate()%></td>
</tr>
<%}%>
    <% 
    if(session.getAttribute("user_id")!=null){
    %>
<tr>
<td colspan=5>
<input type="button" id="writer" value="글쓰기" onclick="location.href='writing.jsp'">
</td>
</tr>
<%} %>

<!-- 페이지 블럭 생성 시작 -->
<%
	PageDto pageDto = new PageDto(count, criteria);

%>
</form>
<table width="90%">
	<tr>
		<td algin="center">
		<%@include file="PageNav.jsp" %>
		<script>
			let btn = document.getElementsByName("button")[0];
		    btn.onclick = (e)=>{
				console.log(e.target);
				}
				

		</script>
		</td>
	</tr>
</table>

</body>
</html>