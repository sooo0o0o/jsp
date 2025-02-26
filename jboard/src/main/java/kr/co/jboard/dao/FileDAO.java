package kr.co.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class FileDAO extends DBHelper {
	private static final FileDAO INSTANCE = new FileDAO();
	
	public static FileDAO getInstance() {
		return INSTANCE;
	}
	
	private FileDAO() {}
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<FileDTO> findExistFile(String fno){
		List<FileDTO> files = new ArrayList<>();
		try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL.SELECT_EXIST_FILE_BY_ARTICLE);
	        psmt.setInt(1, Integer.parseInt(fno)); // String → int 변환
	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            FileDTO file = new FileDTO();
	            file.setFno(rs.getInt("fno"));
	            file.setAno(rs.getInt("ano"));
	            file.setoName(rs.getString("oName"));
	            file.setsName(rs.getString("sName"));
	            file.setDownload(rs.getInt("download"));
	            file.setRdate(rs.getString("rdate"));

	            files.add(file);
	        }
	        closeAll();
	    } catch (Exception e) {
	        logger.error(e.getMessage());
	    }
	    
	    return files; // 여러 개의 파일 반환
	}
	
	public void insertFile(FileDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getoName());
			psmt.setString(3, dto.getsName());
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public FileDTO selectFile(String fno) {
		
		FileDTO fileDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_FILE_BY_FNO);
			psmt.setString(1, fno);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				//조회 결과
				fileDTO = new FileDTO();
				fileDTO.setFno(rs.getInt(1));
				fileDTO.setAno(rs.getInt(2));
				fileDTO.setoName(rs.getString(3));
				fileDTO.setsName(rs.getString(4));
				fileDTO.setDownload(rs.getInt(5));
				fileDTO.setRdate(rs.getString(6));
			}
			closeAll();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return fileDTO;
	}
	public List<FileDTO> selectAllFile() {
		return null;
	}
	public void updateFile(FileDTO dto) {}
	
	public void updateFileDownloadCount(String fno) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_FILE_DOWNLOAD_COUNT);
			psmt.setString(1, fno);
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
	public void deleteFile(int fno) {}
	
	

}
