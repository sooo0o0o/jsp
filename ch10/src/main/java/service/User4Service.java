package service;

import dao.User4DAO;

public class User4Service {
		
	private final static User4Service INSTANCE = new User4Service();
	public static User4Service getInstance() {
		return INSTANCE;
	}
	private User4Service() {}
	
	//DAO 가져오기
	private User4DAO dao = User4DAO.getInstance();
	
	//기본 CRUD
	
	public void instertUser4() {}
			
	public void selectUser4() {}
			
	public void selectAllUser4() {}
	
	public void updateUser4() {}
			
	public void deleteUser4() {}

}
