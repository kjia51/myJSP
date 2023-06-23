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
	<h2>MVC 모델2 게시판</h2>
	<c:set var="filelist" value="${requestScope.list }"></c:set>
	총 게시물 수 : ${count }
	<form name="searchForm"> 
	<input type='hidden' name='pageNo' value='${pageNo }'>
	<table border="1" width="90%" style="text-align:center">
	<tr>
	<td>
	<select name="searchField">
        <option value="">선택</option>
        <option value="title" ${param.searchField eq "title" ? "selected" : ""} >제목</option>
        <option value="content" ${param.searchField eq "content" ? "selected" : ""} >내용</option>
	</select>
	<input type="text" name="searchWord" value=${param.searchWord}>
	<input type="submit" value="검색"/>
	</form>
	</td>
	</tr>
	</table>
	
	<table border="1" width="90%" >
	<tr style="text-align:center">
	<th>일련번호</th>
	<th>작성자 이름</th>
	<th>제목</th>
	<th>내용</th>
	<th>작성일</th>
	<th>원본 파일명</th>
	<th>저장된 파일명</th>
	<th>다운로드 횟수</th>
	<th>조회수</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty filelist }" >
			<tr style="text-align:center"><td colspan="10">등록된 게시물이 없습니다.</td></tr>
		</c:when>

	<c:otherwise>
	<c:forEach var="list" items="${filelist}">
	<tr style="text-align:center">
	<td>${list.idx }</td>
	<td>${list.name }</td>
	<td><a href="../mvcboard/view.do?idx=${list.idx }">${list.title }</a></td>
	<td>${list.content }</td>
	<td>${list.postdate }</td>
	<td>${list.ofile }</td>
	<td>${list.sfile }</td>
	<td>${list.downcount }</td>
	<td>${list.visitcount }</td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	<tr>
	<td colspan="9">
	<input type="button" value="글쓰기 " style="float:right" onclick="location.href='../mvcboard/write.do';">
	</td>
	</tr>
	</table>
	<table border="1" width="90%" >
	
	<tr style="text-align:center">
		<td><%@include file="PageNavi.jsp" %></td>
	</tr>
	</table>
</body>
</html>