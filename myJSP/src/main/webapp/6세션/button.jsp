<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input{
background-color:white;
}
.active{
background-color:red;
}
</style>
</head>
<body>
<input type="button" id="btn1" value="버튼1">
<input type="button" id="btn2" value="버튼2">
<input type="button" id="btn3" value="버튼3">


<script>
let btn =document.getElementsByTagName('input');
btn.click(function(e){
	btn.removeClass("active");
	  e.addClass("active");
	});
</script>
</body>
</html>