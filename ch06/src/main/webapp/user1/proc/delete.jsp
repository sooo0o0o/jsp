<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	//데이터베이스 처리
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "root";
	//String pass = "1234";
	
	try{
		//1단계 - JDBC 드라이버 로드
		//Class.forName("com.mysql.cj.jdbc.Driver");
				
		//2단계 - 데이터베이스 접속
		//Connection conn = DriverManager.getConnection(host, user, pass);
		
		//DBCP
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
				
		//3단계 - SQL 실행 객체 생성
		String sql = "DELETE FROM `user1` WHERE `uid`=?";
				
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		//4단계 - SQL 실행
		psmt.executeUpdate();
				
		//6단계 - 데이터베이스 종료
		conn.close();
		psmt.close();
				
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("../list.jsp");
	
%>