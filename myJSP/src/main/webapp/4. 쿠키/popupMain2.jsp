<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 활용한 팝업창 제어 ver 2.0</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    div.active{
    	display: none;
    }
    .off{
    	display:none;
    }
</style>
<script>
	window.onload = function(){
		closeBtn.addEventListener('click', function(){
			popup.style.display="none";
			var chkval = document.querySelector("#inactiveToday:checked");
			if(chkval != null && chkval.value==1){
				//alert('쿠키생성');
				console.log('쿠키생성요청');
				fetch('popupCookie.jsp')
					.then((data)=>data.json)
					.then((json)=>{
						console.log("popupCookie.jsp호출")
					})
			}
		});
	}
</script>
</head>
<body>
	<h2>쿠키를 활용한 팝업창 제어 ver 2.0</h2>
<%
	String off = CookieManager.readCookie(request, "popupClose").equals("")?"":"off";
// 쿠키에 popupClose가 등록되어있으면 class 속성을 이용해 팝업창을 출력하지 않도록 처리
%>
	 <div id="popup" class="<%=off%>">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	        </form>
        </div>
    </div>

</body>
</html>