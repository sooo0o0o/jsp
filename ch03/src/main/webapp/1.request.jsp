<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<!-- 
		날짜 : 2025.02.04
		이름 : 곽혜수
		내용 : JSP 내장객체 request 실습하기
		
		request 내장 객체
		 - 클라이언트의 요청 정보를 갖는 객체
		 - 클라이언트의 전송 데이터를 수신처리 하기위한 기능 제공(getParameter)
		 
		GET vs. POST
		 - GET : 기본 데이터 전송방식(default) 
		 		 전송 데이터를 주소(URL)에 붙여서 서버로 전송
		 		 전송 데이터가 노출되기 때문에 보안에 취약하나, POST보다 전송 속도가 빠름
		 		 
		 - POST : 전송 데이터를 request 요청 객체의 body 에 저장해서 전송
		 		  전송 데이터를 주소에 노출 시키지 않아 보안에 유리
		 		  대량의 데이터를 전송하기에 적합
		
	 -->
</head>
	
<body>
	<h3>1. request 내장객체</h3>
	
	<h4>GET방식 데이터 전송</h4>
	<form action="./proc/result1.jsp" method="get">
		<input type="text" name="uid"><br>
		<input type="text" name="name"><br>
		<input type="number" name="age"><br>
		<input type="submit" name="전송하기"><br>
	</form>
	<!-- 
		데이터 수신 시 링크에 쿼리스트링(key=value)가 같이 나옴
		http://localhost:8080/ch03/proc/result1.jsp?uid=&name=&age=&%EC%A0%84%EC%86%A1%ED%95%98%EA%B8%B0=%EC%A0%9C%EC%B6%9C
	 -->
	
	<h4>POST방식 데이터 전송</h4>
	<form action="./proc/result1.jsp" method="post">
		<input type="text" name="uid"><br>
		<input type="text" name="name"><br>
		<input type="number" name="age"><br>
		<input type="submit" name="전송하기"><br>
	</form>
	<!-- 
		데이터 수신 후 링크에 쿼리 스트링이 없이 나옴 ( null ) 
		http://localhost:8080/ch03/proc/result1.jsp
		form data가 숨겨져있음
	-->
	
	<h4>확인문제</h4>
	<!-- 데이터 기본 전송 포멧 : GET -->
	<form action="./proc/result2.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" placeholder="아이디 입력"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" placeholder="날짜 선택"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>	
					</select>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산">등산</label>
					<label><input type="checkbox" name="hobby" value="독서">독서</label>
					<label><input type="checkbox" name="hobby" value="영화">영화</label>
					<label><input type="checkbox" name="hobby" value="운동">운동</label>
					<label><input type="checkbox" name="hobby" value="게임">게임</label>

				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="전송하기">
				
				</td>
			</tr>
		
		</table>
	
	</form>
	
	<h4>request 기타정보</h4>
	<p>
		헤더정보#1 : <%= request.getHeader("User-Agent") %><br>
		헤더정보#2 : <%= request.getHeader("referer") %><br>
		헤더정보#3 : <%= request.getHeader("cookie") %><br>
		프로토콜 : <%= request.getProtocol() %><br>
		서버이름 : <%= request.getServerName() %><br>
		요청주소 : <%= request.getRequestURL() %><br>	<!-- url = 도메인주소/path -->
		요청경로 : <%= request.getRequestURI() %><br> <!-- path -->
		IP주소 : <%= request.getRemoteAddr() %><br>
	
	</p>
	
	
	
</body>
</html>