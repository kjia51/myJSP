<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 검색폼 시작 -->
    <form method="get" name="searchForm">  
    <!-- 페이지 번호 -->
    <input type="text" name="pageNo">
    <input type="hidden" name="delNo">

    <table border="1" width="90%">    
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="no" ${param.searchField eq "no" ? "selected" : "" }>번호</option>
                <option value="title" ${param.searchField eq "title" ? "selected" : "" }>제목</option>
                <option value="author" ${param.searchField eq "author" ? "selected" : "" }>저자</option>
                <option value="rentyn" ${param.searchField eq "rentyn" ? "selected" : "" }>대여여부</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord }" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>
    <!-- 검색폼 끝 -->
</body>
</html>