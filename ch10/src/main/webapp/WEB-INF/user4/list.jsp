<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user4::list</title>
</head>
<body>
	<h3>user4 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user4/register.do">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>번호</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.getUid()}</td>
				<td>${dto.getName()}</td>
				<td>${dto.getGender()}</td>
				<td>${dto.getAge()}</td>
				<td>${dto.getHp()}</td>
				<td>${dto.getAddr()}</td>
				<td>
					<a href="/ch10/user4/modify.do?uid=${dto.uid}">수정</a>
					<a href="/ch10/user4/remove.do?uid=${dto.uid}">삭제</a>
				</td>
			</tr>
		</c:forEach>
		
	
	
	</table>
	
</body>
</html>