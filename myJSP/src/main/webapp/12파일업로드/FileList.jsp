<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDto"%>
<%@page import="fileupload.FileDao"%>
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
<h1>db에 등록된 파일 목록 보기</h1>
<a href="1FileUpload.jsp">파일 등록하기</a><br>
<%
	FileDto dto = new FileDto();
	FileDao dao = new FileDao();
	List<FileDto> filelist = dao.getFileList();
	out.print("총건수 : " +filelist.size());
	

%>

<c:set var="filelist" value="${requestScope.list}"></c:set>

<table border='1'>
<tr>
<th>No</th>
<th>작성자</th>
<th>제목</th>
<th>카테고리</th>
<th>원본 파일명</th>
<th>저장된 파일명</th>
<th>작성일</th>
<th></th>
</tr>
<c:forEach items="${filelist }" var="file">
<tr>
<td>${file.idx }</td>
<td>${file.name }</td>
<td>${file.title }</td>
<td>${file.cate }</td>
<td>${file.ofile }</td>
<td>${file.sfile }</td>
<td>${file.postdate }</td>

<td><a href="Download.jsp?oName=${file.ofile }&sName=${file.sfile}">[다운로드]</a></td>
</tr>
</c:forEach>

</table>

</body>
</html>