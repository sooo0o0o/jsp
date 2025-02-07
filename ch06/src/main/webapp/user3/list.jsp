<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User3"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	List<User3> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user3`");
		
		while(rs.next()){
			User3 user3 = new User3();
			user3.setUid(rs.getString(1));
			user3.setName(rs.getString(2));
			user3.setBirth(rs.getString(3));
			user3.setHp(rs.getString(4));
			user3.setAddr(rs.getString(5));
			
			users.add(user3);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user3::list</title>
</head>
<body>
	<h3>user3 목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>번호</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<%
			for(User3 user3 : users){
		%>
		<tr>
			<td><%= user3.getUid() %></td>
			<td><%= user3.getName() %></td>
			<td><%= user3.getBirth() %></td>
			<td><%= user3.getHp() %></td>
			<td><%= user3.getAddr() %></td>
			<td>
				<a href="./modify.jsp?uid=<%=user3.getUid()%>">수정</a>
				<a href="./proc/delete.jsp?uid=<%=user3.getUid()%>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>