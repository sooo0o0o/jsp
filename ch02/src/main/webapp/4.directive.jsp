<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" info="deb by tkdenddl1324"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<%--
		날짜 : 2025.02.03
		이름 : 곽혜수
		내용 : JSP 지시자 실습하기
	--%>
</head>
<body>
	<h3>4. 지시자</h3>
	
	<h4>page 지시자</h4>
	<%
		Account kb = new Account("국민은행","110-11-1001","김유신",10000);
		Account wr = new Account("우리은행","110-11-1002","김춘추",30000);
		
		kb.deposit(35000);
		kb.withdraw(7000);
		kb.show(out);	//JSP 내장객체 out을 인자로 전달
		
		wr.deposit(40000);
		wr.withdraw(8000);
		wr.show(out);
		
		//page 지시자 info 속성값 참조
		String info = getServletInfo();
		
	%>
	<p>info : <%=info %></p>
	
	
	<h4>include 지시자</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>

	
	
	<h4>tablib 지시자</h4>
	
	
	
	<h4>JSTL에서 실습</h4>
	
	
	
</body>
</html>