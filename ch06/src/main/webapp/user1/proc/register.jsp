<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신 -> 데이터 송신시 무조건 String 으로 전송되므로, 타입은 무조건 *** String ***
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	//int intAge = Integer.parseInt(age); -> 문자열을 int로 바꾸는 과정이 필요해짐
	
	//데이터베이스 처리
	//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	//String user = "root";
	//String pass = "1234";
	
	try{
		//1단계 - JDBC 드라이버 로드
		//Class.forName("com.mysql.cj.jdbc.Driver");	//library가 필요함!
		
		//2단계 - 데이터베이스 접속
		//Connection conn = DriverManager.getConnection(host, user, pass);
		
		//DBCP 방식
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		
		//3단계 - SQL 실행 객체 생성
		String sql = "INSERT INTO `user1` VALUE (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);	//psmt.setString(4, parseInt(age));
		//int(number) 변수를 String 으로 매핑하여 입력하므로 숫자지만 setString 해도 상관X
		
		
		//4단계 - SQL 실행
		psmt.executeUpdate();
		
		//5단계 - 결과셋 처리 (Only for SELECT)
		
		
		//6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("../list.jsp");
	
	
%>