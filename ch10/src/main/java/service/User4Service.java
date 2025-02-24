package service;

import java.util.List;

import dao.User4DAO;
import dto.User4DTO;

public class User4Service {
		
	private final static User4Service INSTANCE = new User4Service();
	public static User4Service getInstance() {
		return INSTANCE;
	}
	private User4Service() {}
	
	//DAO 가져오기
	private User4DAO dao = User4DAO.getInstance();

	public void registerUser4(User4DTO dto) {
		dao.insertUser4(dto);
	}
			
	public User4DTO findUser4(String uid) {
		return dao.selectUser4(uid);
	}
			
	public List<User4DTO> FindAll() {
		return dao.selectAllUser4();
	}
	

	public void modifyUser4(User4DTO dto) {
		dao.updateUser4(dto);
	}
			
	public void removeUser4(String uid) {
		dao.deleteUser4(uid);
	}
	
	

}
