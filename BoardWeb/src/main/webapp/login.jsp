<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
	cellpadding="?" => padding: ?px; 
	cellspacing="?" => border-spacing: ?px;
	없음 => border-collapse: collapse;
-->

<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<img src="image/ball.png" width="100" height="80">
	<hr>
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td bgcolor="orange"> 아이디 </td>
				<td><input type="text" name="id"/></td>
			</tr>
			
			<tr>
				<td bgcolor="orange"> 비밀번호 </td>
				<td><input type="password" name="password"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"> 
					<input type="submit" value="로그인"/>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<a href="insertUser.html">회원가입</a>
	<hr>
</body>
</html>