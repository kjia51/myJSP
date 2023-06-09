<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업창 제어 ver1.0</title>
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
</style>
    <script>
    window.onload=function(){
    	if(typeof closeBtn != 'undefined'){
    		closeBtn.addEventListener('click',function(){
    			//체크박스가 체크되었을때 popup form을 서브밋 처리 -> 쿠키를 생성후 Main으로 Redirect
    		if (document.getElementById("inactiveToday").checked){
    			popFrm.submit();
    		} else{
    			popup.classList.add('active');    			
    			// popup.style.display='none';    			
    		}
    	});
    }	
    	}
    </script>
</head>
<body>
	<h1>쿠키를 이용한 팝업창 제어</h1>
	<%
	String YN = CookieManager.readCookie(request, "PopupClose");
	if(!YN.equals("Y")){
	%>
	 <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm" action="popupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1"  /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	        </form>
        </div>
    </div>
	<%}%>
</body>
</html>