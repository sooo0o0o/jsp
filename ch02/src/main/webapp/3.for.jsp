<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3. for</title>
	<%--
		날짜 : 2025.02.03
		이름 : 곽혜수
		내용 : JSP 반복문 실습하기
	--%>
</head>
<body>
	<h3>JSP 반복문</h3>
	
	<h4>for</h4>
	<%
		for(int i = 0; i<5 ; i++){
			out.println("<p>i : " + i + "</p>");
		}
	%>
	
	<% for(int k = 0; k<5; k++) { %>
		<p>k : <%=k %></p>
	<% } %>
	
	
	<h4>while</h4>
	<%
		int j = 1;
		while(j <= 5){
	%>
		<p> j : <%=j %></p>
	<%
		j++;
		}
	%>	
	
	
	<h4>구구단</h4>
	<table border ="1">
		<tr>
			<th>2단</th>
			<th>3단</th>
			<th>4단</th>
			<th>5단</th>
			<th>6단</th>
			<th>7단</th>
			<th>8단</th>
			<th>9단</th>
		</tr>
		
		<tr>
			<th>2 x 1 = 2</th>
			<th>3 x 1 = 3</th>
			<th>4 x 1 = 4</th>
			<th>5 x 1 = 5</th>
			<th>6 x 1 = 6</th>
			<th>7 x 1 = 7</th>
			<th>8 x 1 = 8</th>
			<th>9 x 1 = 9</th>
			
		</tr>
		
		<% for(int a=2; a<=9; a++) { %>
		
		<tr>
			<%for(int b=1; b<=9; b++) { %>
			<td> <%=a %> x <%=b %> = <%=a*b %></td>
			<% } %>
		</tr>
		<% } %>
		
	
	
	
	
	
	
	</table>
	
	
	
</body>
</html>