package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User4DTO;
import util.DBHelper;
import util.SQL;

public class User4DAO extends DBHelper {
	public static final User4DAO INSTANCE = new User4DAO();
	public static User4DAO getInstance() {
		return INSTANCE;
	}
	
	private User4DAO() {}
	
	//기본 CRUD
	
	public void instertUser4(User4DTO dto) {
		try {
			conn = getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_USER4);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getGender());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getHp());
			psmt.setString(6, dto.getAddr());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public User4DTO selectUser4(String uid) {
		User4DTO dto = null;
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_ALL_USER4);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new User4DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dto.setHp(rs.getString(5));
				dto.setAddr(rs.getString(6));
			}
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<User4DTO> selectAllUser4() {
		List<User4DTO> dtos = new ArrayList<User4DTO>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_ALL_USER4);
			
			while(rs.next()) {
				User4DTO dto = new User4DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}

	public void updateUser4() {}
	
	public void deleteUser4() {}
	
}
