package kr.co.jboard.dao;

import java.util.List;

import kr.co.jboard.dto.CommentDTO;
import kr.co.jboard.util.DBHelper;

public class CommentDAO extends DBHelper {
	private static final CommentDAO INSTANCE = new CommentDAO();
	public static CommentDAO getInstance() {
		return INSTANCE;
	}
	private CommentDAO() {}
	
	public void insertComment(CommentDTO dto) {}
	public CommentDTO selectComment(int cno) {
		return null;
	}
	public List<CommentDTO> selectAllComment() {
		return null;
	}
	public void updateComment(CommentDTO dto) {}
	public void deleteComment(int cno) {}


}
