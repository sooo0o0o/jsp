package dao;

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
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	public List<User2DTO> selectAllUser2() {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	public void updateUser2(User2DTO dto) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteUser2(String uid) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
