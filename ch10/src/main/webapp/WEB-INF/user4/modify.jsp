<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	select box
	radio
	check box
	= value 불러오기를 하려면 java script 필요! 
	
	다른 text, number 값 처럼 ${} 사용을 할 수 없음
-->
<html>
<head>
<meta charset="UTF-8">
<title>user4::modify</title>
</head>
<body>
	<h3>user4 수정</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user4/list.do">목록이동</a>
	
	<form action="/ch10/user4/modify.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" readonly value="${dto.uid}" placeholder="아이디 입력"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${dto.name}" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="${dto.age}" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="${dto.hp}" placeholder="휴대폰 번호 입력"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="${dto.addr}" placeholder="주소 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		
		</table>	
	</form>
	


</body>
</html>