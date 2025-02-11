<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.awt.image.DataBufferDouble"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="entity.FileEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송 데이터 수신
	String seq = request.getParameter("seq");

	//FileEntity 선언
	FileEntity file = null;


	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		String sql = "select * from `file` where `seq`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, seq);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			file = new FileEntity();
			file.setSeq(rs.getInt(1));
			file.setTitle(rs.getString(2));
			file.setName(rs.getString(2));
			file.setoName(rs.getString(2));
			file.setsName(rs.getString(2));
		}
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	//response 파일 다운로드 헤더 정보
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(file.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	//response 파일 스트림 작업
	String path = application.getRealPath("/uploads");
	File target = new File(path + File.separator + file.getsName());
	
	try{
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(target));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		//파일 전송
		bis.transferTo(bos);
		bos.flush();
		bos.close();
		bis.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>
