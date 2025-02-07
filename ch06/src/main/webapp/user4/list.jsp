<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User4"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User4> users = new ArrayList<>();
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user4`");
		
		while(rs.next()){
			User4 user4 = new User4();
			
			user4.setUid(rs.getString(1));
			user4.setName(rs.getString(2));
			user4.setGender(rs.getString(3));
			user4.setAge(rs.getInt(4));
			user4.setHp(rs.getString(5));
			user4.setAddr(rs.getString(6));
			
			users.add(user4);
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
	<h3>user4 목록</h3>
	<a href="/ch06/1.jdbc.jsp">처음으로</a>
	<a href="/ch06/user4/register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<%
			for(User4 user4 : users){	
		%>
		<tr>
			<td><%= user4.getUid() %></td>
			<td><%= user4.getName() %></td>
			<td><%= user4.getGender() %></td>
			<td><%= user4.getAge() %></td>
			<td><%= user4.getHp() %></td>
			<td><%= user4.getAddr() %></td>
			<td>
				<a href="/ch06/user4/modify.jsp">수정</a>
				<a href="/ch06/user4/proc/delete.jsp">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>