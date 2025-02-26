package kr.co.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class ArticleDAO extends DBHelper {
	
	private static final ArticleDAO INSTANCE = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return INSTANCE;
		
	}
	
	private ArticleDAO() {}
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO dto) {
		int no = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			psmt.executeUpdate();
			
			
			//글번호 조회
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			if(rs.next()) {
				no = rs.getInt(1);
				
			}
			
			closeAll();			
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return no;
	}
	
	
	//실제 DB의 no 값이 INT 지만, String 으로 써도 조회 가능
	public ArticleDTO selectArticle(String no) {
		
		ArticleDTO dto = null;
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_WITH_FILE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				if(dto == null) {
					dto = new ArticleDTO();
					dto.setNo(rs.getInt(1));
					dto.setCate(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setComment(rs.getInt(5));
					dto.setFile(rs.getInt(6));
					dto.setHit(rs.getInt(7));
					dto.setWriter(rs.getString(8));
					dto.setRegip(rs.getString(9));
					dto.setWdate(rs.getString(10));
					dto.setNick(rs.getString(17));
				}
				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFno(rs.getInt(11));
				fileDTO.setAno(rs.getInt(12));
				fileDTO.setoName(rs.getString(13));
				fileDTO.setsName(rs.getString(14));
				fileDTO.setDownload(rs.getInt(15));
				fileDTO.setRdate(rs.getString(16));
				files.add(fileDTO);
			}//while end
			
			dto.setFiles(files);
			
			closeAll();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return dto;
	}//selectArticle end
	
	public int selectCountArticle(){
		
		int total = 0;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_ARTICLE);
			
			if(rs.next()) {
				total = rs.getInt(1);
				
			}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		
		return total;
		
	}
	
	public List<ArticleDTO> selectAllArticle(int start) {
		
		List<ArticleDTO> articles = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ALL_ARTICLE);
			psmt.setInt(1, start); //start : 매개변수값으로 받아올것!
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setWdate(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
			}
			closeAll();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	public int selectCountArticleBySearch(ArticleDTO articleDTO) {
		
		int count = 0;
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_ARTICLE_FOR_SEARCH);
		
		if(articleDTO.getSearchType().equals("title")) {
			sql.append(SQL.WHERE_FOR_SEARCH_TITLE);
			
		}else if(articleDTO.getSearchType().equals("content")) {
			sql.append(SQL.WHERE_FOR_SEARCH_CONTENT);
			
		}else if(articleDTO.getSearchType().equals("writer")) {
			sql.append(SQL.JOIN_FOR_SEARCH_NICK);
			sql.append(SQL.WHERE_FOR_SEARCH_WRITER);

		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%"+articleDTO.getKeyword()+"%");
			logger.debug(psmt.toString());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			closeAll();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return count;
	}
	public List<ArticleDTO> selectAllArticleBySearch(ArticleDTO articleDTO, int start) {
		/*
		 * String: 불변 객체
		 => 문자열을 변경할 때마다 새 객체가 생성되어 메모리와 성능에 부담
		 
		 * StringBuilder는 가변(mutable) 객체
		 * 동적 SQL 쿼리처럼 여러 부분을 조건에 따라 추가할 때 StringBuilder를 사용
		  => 반복적인 문자열 생성 없이 동일한 객체 내에서 수정이 이루어져 성능상 이점
		*/
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		
		try {
			StringBuilder sql = new StringBuilder(SQL.SELECT_ALL_ARTICLE_BY_SEARCH);
			
			if(articleDTO.getSearchType().equals("title")) {
				//sql += SQL.WHERE_FOR_SEARCH_TITLE;
				sql.append(SQL.WHERE_FOR_SEARCH_TITLE);
				sql.append(SQL.ORDER_FOR_SEARCH);
				sql.append(SQL.LIMIT_FOR_SEARCH);
				
			}else if(articleDTO.getSearchType().equals("content")) {
				//sql += SQL.WHERE_FOR_SEARCH_CONTENT;
				sql.append(SQL.WHERE_FOR_SEARCH_CONTENT);
				sql.append(SQL.ORDER_FOR_SEARCH);
				sql.append(SQL.LIMIT_FOR_SEARCH);
				
			}else if(articleDTO.getSearchType().equals("writer")) {
				//sql += SQL.WHERE_FOR_SEARCH_WRITER;
				sql.append(SQL.WHERE_FOR_SEARCH_WRITER);
				sql.append(SQL.ORDER_FOR_SEARCH);
				sql.append(SQL.LIMIT_FOR_SEARCH);
			}
			
			
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%"+articleDTO.getKeyword()+"%");
			psmt.setInt(2, start);
			logger.debug(psmt.toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setWdate(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
			}
			closeAll();
			
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public void updateArticle(ArticleDTO dto) {}
	public void deleteArticle(int no) {}
	
	

}
