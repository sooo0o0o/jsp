<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::list</title>
</head>
<body>
	<h3>user1 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user1/register.do">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.getUid()}</td>
				<td>${dto.getName()}</td>
				<td>${dto.getHp()}</td>
				<td>${dto.getAge()}</td>
				<td>
					<a href="/ch10/user1/modify.do?uid=${dto.uid}">수정</a>
					<a href="/ch10/user1/remove.do?uid=${dto.uid}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>