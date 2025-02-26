package kr.co.jboard.util;

public class SQL {
	
	//terms
	public static final String SELECT_TERMS = "select * from `terms` where `no`=?";
	public static final String SELECT_ALL_TERMS = "";
	public static final String MODIFY_TERMS = "";
	public static final String DELETE_TERMS = "";
	
	//users
	public static final String SELECT_COUNT_USER = "select COUNT(*) from `user` ";
	public static final String WHERE_UID = "where `uid`=?";
	public static final String WHERE_NICK = "where `nick`=?";
	public static final String WHERE_EMAIL = "where `email`=?";
	public static final String WHERE_HP = "where `hp`=?";
	
	public static final String SELECT_USER = "select * from `user` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String INSERT_USER = "insert into `user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	//articles
	public static final String SELECT_MAX_NO = "select MAX(`no`) from `article`"; //최신 업로드된 글의 번호 = 방금 업로드 한 article 의 no
	public static final String SELECT_COUNT_ARTICLE = "select count(*) from `article`";
	public static final String SELECT_ARTICLE_WITH_FILE = "select "
														+"a.*,"
														+"f.*,"
														+"u.`nick` "
														+"from `article` AS a "
														+"LEFT JOIN `file` AS f ON a.no = f.ano "
														+"JOIN `user` AS u ON a.writer = u.uid "			
														+"where a.`no`=?";
	public static final String SELECT_ALL_ARTICLE = "select "
													+ "a.*,"
													+ "u.`nick` "
													+ "from `article` as a "
													+ "join `user` as u "
													+ "on a.writer = u.uid "
													+ "order by `no` desc "
													+ "limit ?, 10";
	public static final String SELECT_ALL_ARTICLE_BY_SEARCH = "SELECT "
															+"a.*, "
															+"u.`nick` "
															+"FROM `article` AS a "
															+"JOIN `user` AS u ON a.writer = u.uid ";
	public static final String SELECT_COUNT_ARTICLE_FOR_SEARCH = "select count(*) from `article` ";
	public static final String JOIN_FOR_SEARCH_NICK = "JOIN `user` as u ON a.writer = u.uid ";
	
	public static final String WHERE_FOR_SEARCH_TITLE 	= "WHERE `title` LIKE ? ";
	public static final String WHERE_FOR_SEARCH_CONTENT = "WHERE `content` LIKE ? ";
	public static final String WHERE_FOR_SEARCH_WRITER 	= "WHERE `nick` LIKE ? ";
	
	public static final String ORDER_FOR_SEARCH = "ORDER BY `no` DESC ";
	
	public static final String LIMIT_FOR_SEARCH = "LIMIT ?,10";

	public static final String INSERT_ARTICLE = "insert into `article` set "
												+"`title`=?,"
												+"`content`=?,"
												+"`file`=?,"
												+"`writer`=?,"
												+"`regip`=?,"
												+"`wdate`=NOW()";
	
	//files
	public static final String INSERT_FILE = "insert into `file` set"
											+"`ano`=?,"
											+"`oName`=?,"
											+"`sName`=?,"											
											+"`rdate`=NOW()";
	public static final String SELECT_FILE_BY_FNO = "select * from `file` where `fno`=?";
	public static final String UPDATE_FILE_DOWNLOAD_COUNT = "UPDATE `file` SET `download` = `download` + 1 WHERE `fno`=?";
	public static final String SELECT_EXIST_FILE_BY_ARTICLE = "SELECT * FROM file WHERE ano = ?";
	
	
	
}
