<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- PageDto 객체를 가지고 페이지 블럭을 생성
	- 페이지블럭의 시작번호
	- 페이지블럭의 끝번호
	- 게시물의 끝 페이지 번호
	- 이전/다음 출력여부
 -->
 <%
 	PageDto dto = new PageDto(300, new Criteria(1));
 
 %>
	<c:set var="pageDto" value="<%=dto%>"></c:set>
	<c:if test="${pageDto.prev }">
		<a href='PageNavi.jsp?pageNo=1'>처음</a>
	</c:if>
	<c:if test="${pageDto.prev }">
		<a href='PageNavi.jsp?pageNo=${pageDto.startNo-1}'>이전</a>
	</c:if>
	<c:forEach begin="${pageDto.startNo}" end="${pageDto.endNo}" var="No">
		<a href='PageNavi.jsp?pageNo=${No}'>${No}</a>
	</c:forEach>

	<c:if test="${pageDto.next }">
		<a href='PageNavi.jsp?pageNo=${pageDto.endNo+1}'>다음</a>
	</c:if>
	<c:if test="${pageDto.next }">
		<a href='PageNavi.jsp?pageNo=${pageDto.realEnd}'>마지막</a>
	</c:if>
</body>
</html>