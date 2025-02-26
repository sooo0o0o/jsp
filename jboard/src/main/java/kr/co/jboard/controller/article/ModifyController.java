package kr.co.jboard.controller.article;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jboard.dao.FileDAO;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.service.ArticleService;
import kr.co.jboard.service.FileService;

@WebServlet("/article/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1271261235653325736L;
	
	private ArticleService service = ArticleService.INSTANCE;
	private FileService fileService = FileService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 // 수정할 게시글 번호 가져오기
        String no = req.getParameter("no");
        String fno = req.getParameter("fno");

        // 기존 글 정보 조회
        ArticleDTO article = service.findArticle(no);
        req.setAttribute("article", article);
        
        //기존 파일 정보 조회
        List<FileDTO> files = fileService.findExistFile(fno);
        req.setAttribute("files", files);
        
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/modify.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력된 Article 데이터 가져오기
		String no = req.getParameter("no");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");

		String[] deleteFiles = req.getParameterValues("deleteFiles");
		
		//기존 게시글 DB에서 불러오기
		FileDAO fileDAO = FileDAO.getInstance();
		FileDTO fileDTO = fileDAO.selectFile(no);
		
		// 기존 파일 삭제
        if (deleteFiles != null) {
            for (String fno : deleteFiles) {
                fileService.deleteFile(Integer.parseInt(fno));
            }
        }
		
        // 새로운 파일 업로드
        List<FileDTO> newFiles = fileService.uploadFile(req);
        
        // DTO 생성 및 데이터 설정
        ArticleDTO dto = new ArticleDTO();
        dto.setNo(Integer.parseInt(no));
        dto.setTitle(title);
        dto.setContent(content);
        dto.setFile(newFiles.size());
        dto.setWriter(writer);
        
        // 글 수정 서비스 호출
        service.modifyArticle(dto);
		
        // 새 파일 등록
        for (FileDTO files : newFiles) {
            fileDTO.setAno(Integer.parseInt(no));
            fileService.registerFile(fileDTO);
        }
		
		//이동
		resp.sendRedirect("/jboard/article/view.do?no="+no);
	}
}
