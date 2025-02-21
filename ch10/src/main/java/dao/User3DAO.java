package dao;

import java.util.List;

import util.DBHelper;

public class User3DAO extends DBHelper {
	public static final User3DAO INSTANCE = new User3DAO();
	public static User3DAO getInstance() {
		return INSTANCE;
	}
	
	private User3DAO() {}
	
	//기본 CRUD
	
	public void insertUser3() {}
	
	public User3DTO selectUser3(String uid) {
		return null;
	}
	
	public List<User3DTO> selectAllUser3() {
		return null;
	}
	
	public void updateUser3(User3DTO) {}
	
	public void deleteUser3() {}

}
