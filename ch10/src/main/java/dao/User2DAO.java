package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User2DTO;
import util.DBHelper;
import util.SQL;

public class User2DAO extends DBHelper {
	
	private static final User2DAO INSTANCE = new User2DAO();
	public static User2DAO getInstance() {
		return INSTANCE;
	}
	
	private User2DAO() {}
	
	//기본 CURD
	
	public void insertUser2(User2DTO dto) {
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_USER2);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getAddr());
			psmt.executeUpdate();
			closeAll();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public User2DTO selectUser2(String uid) {
		User2DTO dto = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER2);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
				
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	public List<User2DTO> selectAllUser2() {
		List<User2DTO> dtos = new ArrayList<User2DTO>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_ALL_USER2);
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
				
				dtos.add(dto);
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	public void updateUser2(User2DTO dto) {
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.UPDATE_USER2);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getUid());
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteUser2(String uid) {
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.DELETE_USER2);
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
