<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
커넥션 풀 
Jndi
 D:\apache-tomcat-9.0.65\conf
 -->
 
<%
	Connection con = DBConnPool.getConnection();
	PreparedStatement psmt = con.prepareStatement("select sysdate from dual");
	ResultSet rs = psmt.executeQuery();
	if(rs.next()){
		out.print(rs.getString(1));
	}
	rs.close();
	psmt.close();
	con.close();
%>
</body>
</html>