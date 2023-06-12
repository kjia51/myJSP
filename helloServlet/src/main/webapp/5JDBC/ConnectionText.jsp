<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, td, tr, th{
border: 1px solid black;
}

</style>
</head>
<body>
	<h2>회원목록 조회</h2>
	<table border=1>
	
	<%
		Connection conn = ConnectionUtil.getConnection();
		String sql = "select id, name, regidate from member";
		PreparedStatement pstm = conn.prepareStatement(sql);
		
		//쿼리실행
		ResultSet rs = pstm.executeQuery();
		out.print(String.format("<tr><th>ID</th><th>NAME</th><th>REGIDATE</th></tr>"));
		while(rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regidate = rs.getString("regidate");
			out.print(String.format("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", id, name, regidate));
		}
		rs.close();
		pstm.close();
		conn.close();
	%>
	</table>
</body>
</html>