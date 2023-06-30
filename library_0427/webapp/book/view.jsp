<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판-</title>
<script type="text/javascript">
	function setAction(action){
		viewForm.action=action;
	}
</script>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<h2></h2>
<%@include file="/common/header.jsp" %>
<form name="viewForm " method="post">
도서번호 : <input name="no" value="${dto.no }" style="width:50px;" >
대여번호 : <input name="rentno" value="${dto.rentno }" style="width:50px;">
<table border="1" width="100%">
    <colgroup>
   		 <col width="30%"/>
        <col width="17%"/> <col width="20%"/>
        <col width="15%"/> <col width="20%"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td rowspan="3">
        <img alt="${dto.title }이미지" width="200px" height="100%" src="../images/bookimg/${dto.sfile }"></td>
        <td>도서명</td> <td>${ dto.title }</td>
        <td>작가</td> <td>${ dto.author }</td>
        
        
    </tr>
    <tr>
		<td>대여</td>
		<c:choose>
			<c:when test="${empty dto.rentno }">
				<td colspan="3"><button onclick="location.href='../rent.book?no=${dto.no }'">대여하기</button>
			</c:when>
			<c:when test="${dto.id eq sessionScope.userId }">
				<td><button onclick="setAction('./return.book')">반납하기</button>
				<td>대여기간</td><td>${dto.startDate } ~ ${dto.endDate }</td>
			</c:when>
			<c:otherwise>
       			<td>대여중</td>
       			<td>대여기간</td> <td>${ dto.startDate } ~ ${ dto.endDate }</td>
       		</c:otherwise>
		</c:choose>
		
    </tr>
    <tr>
    	<td>상세설명</td>
    	<td colspan="3"></td>
    </tr>


    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="5" align="center">
            <button type="button" onclick="location.href='';">
                수정하기
            </button>
            <button type="button" onclick="location.href='./delete.book'';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='./list.book';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
