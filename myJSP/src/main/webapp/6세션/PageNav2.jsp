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
<style>
input[type='button']{
width:40px;
height:40px;
}
</style>
</head>
<body>

<script>

	function go(page){
		document.searchForm.pageNo.value=page;
		location.href="List.jsp?pageNo="+page;

		document.searchForm.submit();
		//document.querySelectorAll('input')[2].style.backgroundColor = "green";
	}

</script>
	



	<c:set var="pageDto" value="<%=pageDto%>"></c:set>
	<c:if test="${pageDto.prev }">
		<a href='List2.jsp?pageNo=1'>처음</a>
	</c:if>
	<c:if test="${pageDto.prev }">
		<a href='List2.jsp?pageNo=${pageDto.startNo-1}'>이전</a>
	</c:if>
	<c:forEach begin="${pageDto.startNo}" end="${pageDto.endNo}" var="No">
		<a href='List2.jsp?pageNo=${No}'>${No}</a>
	</c:forEach>
	
	<c:if test="${pageDto.next }">
		<a href='List2.jsp?pageNo=${pageDto.endNo+1}'>다음</a>
	</c:if>
	<c:if test="${pageDto.next }">
		<a href='List2.jsp?pageNo=${pageDto.realEnd}'>마지막</a>
	</c:if>




</body>
</html>