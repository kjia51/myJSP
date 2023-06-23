<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<%
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
String num = request.getParameter("num");
int pageNo = request.getParameter("pageNo")==null?1:Integer.parseInt(request.getParameter("pageNo"));

Criteria criteria = new Criteria(searchField, searchWord, pageNo);

NewBoardDao dao = new NewBoardDao();
//List<Board> list = dao.getList(criteria);
List<Board> list = dao.getListPage(criteria);
dao.updateVisitCount(num);
int count= dao.totalCount(criteria);

%>
</head>
<body>
<%@ include file="Link.jsp" %>
    <h2>목록 보기(List)</h2>

    <!-- 검색폼 --> 
총 개수 : <%=dao.totalCount(criteria) %>
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 --> 
        <%
        if(list.isEmpty()){
        %>
        <tr>
        	<td colspan="4">게시물이 없습니다</td>
        </tr>
        <%}%>
        <% 
		for(Board board : list){
		%>
        <tr align="center">
            <td><%=board.getNum()%></td>  <!--게시물 번호-->
            <td align="left">  
                <a href="View.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a> 
            </td>
            <td align="center"><%=board.getId()%></td>          <!--작성자 아이디-->
            <td align="center"><%=board.getVisitcount()%></td>  <!--조회수-->
            <td align="center"><%=board.getPostDate()%></td>    <!--작성일-->
        </tr>
		<%} %>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <%if(session.getAttribute("user_id") != null && !"".equals(session.getAttribute("user_id"))){ %>
	<from method="get" name=searcharForm">
	
	<input>
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <% } %>
    <!-- 페이지 블럭 생성 시작 
    총 건수, 쿼리 수정, form의 이름을 searchform 지어 pageno필드 생성
    -->
<% 
	//V페이시 총넌수
	PageDto pageDto = new PageDto(count, criteria);
%>

<table width="90%">
	<tr>
		<td algin="center">
		<%@include file="../6세션/PageNav.jsp" %>
		</td>
	</tr>
</table>
</body>
</html>
