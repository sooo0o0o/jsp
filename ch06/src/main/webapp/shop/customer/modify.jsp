<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%




%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>customer::modify</title>
</head>
<body>
	<h3>고객수정</h3>
	<a href="/ch06/shop">메인이동</a>
	<a href="/ch06/shop/customer/modify.jsp">고객등록</a>
	
	<form action="/ch06/shop/customer/proc/modify.jsp" method="post">
		<table border="1">
			<tr>
				<td>고객아이디</td>
				<td><input type="text" name="custId" value="<%=customer.getCustId() %>" placeholder="아이디 입력" readonly="readonly"></td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="name" value="<%=customer.getName() %>" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=customer.getHp() %>" placeholder="휴대폰 입력"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=customer.getAddr() %>" placeholder="주소 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="고객등록">
				</td>
			</tr>
	
		</table>
	</form>
	
	
</body>
</html>