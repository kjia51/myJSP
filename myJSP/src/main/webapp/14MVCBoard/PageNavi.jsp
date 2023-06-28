<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function go(page){
		document.searchForm.pageNo.value=pageNo;
		document.searchForm.submit();
	}
</script>

<!-- 영역에 저장 -->
<c:set var="PageDto" value="${pageDto}"></c:set>

<!-- 이전버튼 -->
<c:if test="${pageDto.prev }">
	<input type='button' value='처음' onclick='go(1)'>
</c:if>
<c:if test="${pageDto.prev }">
	<input type='button' value='이전' onclick='go(${PageDto.startNo-1})'>
</c:if>

<!-- 페이지번호 출력 -->
<c:forEach begin="${pageDto.getStartNo() }" end="${PageDto.endNo }" var="i">
	<input type='button' value='${i }' onclick='go(${i})'>
</c:forEach>

<!-- 다음버튼 -->
<c:if test="${pageDto.next }">
	<input type='button' value='다음' onclick='go(${PageDto.endNo+1})'>
</c:if>
<!-- 다음버튼 -->
<c:if test="${pageDto.next }">
	<input type='button' value='마지막' onclick='go(${PageDto.realEnd})'>
</c:if>

</body>
</html>


















