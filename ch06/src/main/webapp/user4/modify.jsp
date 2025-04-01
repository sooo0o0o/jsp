<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user4::modify</title>
</head>
<body>
	<h3>user4 수정</h3>
	<a href="/ch06/1.jdbc.jsp">처음으로</a>
	<a href="/ch06/user4/list.jsp">목록이동</a>
	
	<form action="/ch06/proc/modify.jsp" method="post">
		<table border="1">
		<!--
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%=user4.getUid() %>" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=user4.getName() %>" placeholder="이름 입력"></td>
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
				<td><input type="number" name="age" value="<%=user4.getAge() %>" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=user4.getHp() %>" placeholder="휴대폰 입력"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=user4.getAddr() %>" placeholder="주소 입력"></td>
			</tr>
			<tr>				
				<td colspan="2" align="right">
					<input type="submit" value="등록하기">
				</td>
			</tr>
			  -->
		</table>
	</form>
</body>
</html>