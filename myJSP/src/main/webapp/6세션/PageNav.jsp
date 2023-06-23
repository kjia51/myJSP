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
		document.searchForm.submit();
		//document.querySelectorAll('input')[2].style.backgroundColor = "green";
	}

</script>

<%
	

	if(pageDto.isPrev()){
		//1페이지 블록
		out.print("<input type='button' value='<<' onclick='go(1)'>");
	}
	if(pageDto.isPrev()){
		//이전 페이지 블록
		out.print("<input type='button' value='<' onclick='go("+(pageDto.getStartNo()-1)+")'>");
	}
	
	for(int i=pageDto.getStartNo();i<=pageDto.getEndNo();i++){
		out.print("<input type='button' name='button'  value='"+i+"' onclick='go("+i+")'>");
	}

	//이후 페이지 블록
	if(pageDto.isNext()){
		out.print("<input type='button' value='>' onclick='go("+(pageDto.getEndNo()+1)+")'>");
	}
	//마지막 페이지 블록
	if(pageDto.isNext()){
		out.print("<input type='button' value='>>' onclick='go("+(pageDto.getRealEnd())+")'>");
	}
%>


</body>
</html>