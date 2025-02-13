<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
	<!-- 
		날짜 : 2025.02.13
		이름 : 곽혜수
		내용 : 10장 MVC 아키텍처 실습하기
		
		Controller <-> View 작동 확인
	-->
	<style>
		a {
		border:1px solid black;
		background-color:black;
		color:white;
		}
	</style>
</head>
<body>
	<h3>MVC 아키텍처 실습</h3>
	
	<h4>MVC 기본</h4>
	<!-- MVC에서는 절대경로(프로젝트 명으로 시작하는 주소)를 사용 -->
	<!-- Index : 항상 시작페이지를 의미! -->
	<a href="/ch10/hello.do">hello</a>
	<a href="/ch10/welcome.do">welcome</a>
	<a href="/ch10/greeting.do">greeting</a>
	
	<h4>USER 1</h4>
	<a href="/ch10/user1/list.do">list</a>
	<a href="/ch10/user1/register.do">register</a>
	
	<h4>USER 2</h4>
	<a href="/ch10/user2/list.do">list</a>
	<a href="/ch10/user2/register.do">register</a>
	
	<h4>USER 3</h4>
	<a href="/ch10/user3/list.do">list</a>
	<a href="/ch10/user3/register.do">register</a>
	
	<h4>USER 4</h4>
	<a href="/ch10/user4/list.do">list</a>
	<a href="/ch10/user4/register.do">register</a>
	
	<h4>USER 5</h4>
	<a href="/ch10/user5/list.do">list</a>
	<a href="/ch10/user5/register.do">register</a>

</body>
</html>