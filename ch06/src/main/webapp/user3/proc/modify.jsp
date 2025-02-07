<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
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
		String sql = "UPDATE `user3` SET `name`=?, `birth`=?, `hp`=?, `addr`=? WHERE `uid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,hp);
		psmt.setString(4,addr);
		psmt.setString(5,uid);
		
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