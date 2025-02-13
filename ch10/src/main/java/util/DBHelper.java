package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	
	protected Connection conn = null;
	protected Statement stmt = null;
	protected PreparedStatement psmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() throws NamingException, SQLException {
		
		//JNDI 기본 환경명
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");	
		
		//커넥션 풀에 있는 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb"); 
		
		return ds.getConnection();
		
	}
	
	public void closeAll() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		
		if(stmt != null) {
			stmt.close();
		}
		
		if(psmt != null) {
			psmt.close();
		}

		if(conn != null) {
			conn.close();
		}
		
	}

}
