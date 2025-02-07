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
		//1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
				
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3단계
		String sql = "INSERT INTO `user3` VALUE (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, birth);
		psmt.setString(4, hp);
		psmt.setString(5, addr);
		
		//4단계
		psmt.executeUpdate();
		
		//6단계
		psmt.close();
		conn.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}
	//목록이동
	response.sendRedirect("../list.jsp");

%>
