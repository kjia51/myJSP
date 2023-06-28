<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
 <link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.id.value == "") {
            alert("아이디를 입력하세요.");
            form.id.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.author.value == "") {
            alert("작가를 입력하세요.");
            form.author.focus();
            return false;
        }
        if (form.bookImg.value == "") {
            alert("첨부파일을 입력하세요.");
            form.bookImg.focus();
            return false;
        }
    }
</script>
</head>
<form name="writeFrm" action="./write.book" onsubmit="return validateForm(this);" method="post" enctype="multipart/form-data">
<%@include file="../common/header.jsp" %>
<h2>책 등록하기</h2>
<table border="1" width="90%">
    <!-- 
    <tr>
        <td>아이디</td>
        <td>
            <input type="text" name="id" style="width:150px;" value="${sessionScope.userId }" readonly="readonly"/>
        </td>
    </tr>
    -->
    <tr>
        <td>제목</td>
        <td>
            <input type="text" name="title" style="width:150px;" value="강쥐" />
        </td>
    </tr>
    <tr>
        <td>작가</td>
        <td>
            <input type="text" name="author" style="width:150px;" value="사모예드"/>
        </td>
    </tr>
    <tr>
        <td>책 이미지</td>
        <td>
            <input type="file" name="bookImg" />
        </td>
    </tr>
	<tr>
        <td colspan="2" align="center">
            <button type="submit">작성 완료</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='./list.book';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>

</html>