<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward1</title>
</head>
<body>
	<h3>포워드 페이지 #1</h3>
	
	<%
		//forward - 서버 자원 내에서 제어권 이동이기 때문에, 원격지 타 서버 자원으로 이동 불가
		pageContext.forward("https://naver.com");
	
	%>
</body>
</html>