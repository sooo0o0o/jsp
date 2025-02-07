<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try{
		//1.
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2.
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3.
		String sql = "DELETE FROM `user2` WHERE `uid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,uid);
		
		//4.
		psmt.executeUpdate();
		
		//6.
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("../list.jsp");
%>