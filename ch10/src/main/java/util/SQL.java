package util;

public class SQL {
	//user1
	public static final String INSERT_USER1 = "insert into `user1` values (?,?,?,?)";
	public static final String SELECT_USER1 = "select * from `user1` where `uid`=?";
	public static final String SELECT_ALL_USER1 = "select * from `user1`";
	public static final String UPDATE_USER1 = "update `user1` set "
											+ "`name`=?,"
											+ "`hp`=?,"
											+ "`age`=? where `uid`=?";
	public static final String DELETE_USER1 = "delete from `user1` where `uid`=?";
	
	
	
	//user2
	public static final String INSERT_USER2 = "insert into `user2` values (?,?,?,?)";
	public static final String SELECT_USER2 = "select * from `user2` where `uid`=?";
	public static final String SELECT_ALL_USER2 = "select * from `user2`";
	public static final String UPDATE_USER2 = "update `user2` set "
											+ "`name`=?,"
											+ "`birth`=?,"
											+ "`addr`=? where `uid`=?";
	public static final String DELETE_USER2 = "delete from `user2` where `uid`=?";
	
	
	
	//user3
	public static final String INSERT_USER3 = "insert into `user3` values (?,?,?,?,?)";
	public static final String SELECT_USER3 = "select * from `user3` where `uid`=?";
	public static final String SELECT_ALL_USER3 = "select * from `user3`";
	public static final String UPDATE_USER3 = "update `user3` set "
											+ "`name`=?,"
											+ "`birth`=?,"
											+ "`hp`=?,"
											+ "`addr`=? where `uid`=?";
	public static final String DELETE_USER3 = "delete from `user3` where `uid`=?";
	
	
	
	//user4
	public static final String INSERT_USER4 = "insert into `user4` values (?,?,?,?,?,?)";
	public static final String SELECT_USER4 = "select * from `user4` where `uid`=?";
	public static final String SELECT_ALL_USER4 = "select * from `user4`";
	public static final String UPDATE_USER4 = "update `user4` set "
											+ "`name`=?,"
											+ "`gender`=?,"
											+ "`age`=?,"
											+ "`hp`=?,"
											+ "`addr`=? where `uid`=?";
	public static final String DELETE_USER4 = "delete from `user4` where `uid`=?";
	
	
	
	//user5
	public static final String INSERT_USER5 = "insert into `user5` values (?,?,?,?,?)";
	public static final String SELECT_USER5 = "select * from `user5` where `seq`=?";
	public static final String SELECT_ALL_USER5 = "select * from `user5`";
	public static final String UPDATE_USER5 = "update `user5` set "
											+ "`name`=?,"
											+ "`gender`=?,"
											+ "`age`=?,"											
											+ "`addr`=? where `seq`=?";
	public static final String DELETE_USER5 = "delete from `user5` where `seq`=?";
}
