<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	//abc, 1234를 회원으로 간주
	if(uid.equals("abc")&&pass.equals("1234")){
		//회원이 맞는 경우
		User user = new User();
		user.setUid(uid);
		user.setPass(pass);
		user.setName("홍길동");
		user.setAge(23);
		
		//세션 저장
		session.setAttribute("username",user);
		
		//성공 페이지 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else{
		//회원이 아닌 경우
		response.sendRedirect("../session.jsp?code=100");
		
	}


%>