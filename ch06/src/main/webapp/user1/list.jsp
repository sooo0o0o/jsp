<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="entity.User1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "root";
	//String pass = "1234";
	
	List<User1> users = new ArrayList<>();
	
	try{
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection conn = DriverManager.getConnection(host, user, pass);
		//커넥션 풀에 있는 커넥션을 가져다 쓸 것이므로, 주석처리된 부분은 이제 필요 X
		
		
		//JNDI 기본 환경명
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");	
		
		//커넥션 풀에 있는 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb"); 
		Connection conn = ds.getConnection();
		
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user1`");
		
		while(rs.next()){
			
			User1 user1 = new User1();
			
			user1.setUid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
			
			users.add(user1);
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
	<title>user1::list</title>

</head>
<body>
	<h3>user1 목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<%
			for(User1 user1 : users){
		%>
		<tr>
			<td><%= user1.getUid() %></td>
			<td><%= user1.getName() %></td>
			<td><%= user1.getHp() %></td>
			<td><%= user1.getAge() %></td>
			<td>
				<a href="./modify.jsp?uid=<%=user1.getUid()%>">수정</a>
				<a class="delete" href="./proc/delete.jsp?uid=<%=user1.getUid()%>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	<script>
		document.querySelectorAll('.delete').forEach(button => {
			button.addEventListener('click', function(e) {
				e.preventDefault();
				if(confirm('삭제 하시겠습니까?')){
					window.location.href = this.getAttribute('href');
				}
				
			})
		})
	</script>
	
</body>
</html>