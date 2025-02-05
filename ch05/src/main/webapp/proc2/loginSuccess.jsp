<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("username");

	if(user==null){
		//로그인 없이 페이지 접속 요청시
		response.sendRedirect("../session.jsp?code=102");
		return; //처리 종료
	}
%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>loginSuccess</title>
</head>
<body>
	<h3>로그인 성공</h3>
	<!-- 
	session -> loginSession(정보저장) -> loginSuccess
	즉, 정보는 loginSession에 저장되어있음
	 -->
	<p>
		<%= user.getName() %>님 반갑습니다.	
	</p>
	
	<a href="logout.jsp">로그아웃</a>
	
</body>
</html>