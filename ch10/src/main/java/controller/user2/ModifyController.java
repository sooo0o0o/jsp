package controller.user2;

import java.io.IOException;

import dto.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User2Service;

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet{
	
	private static final long serialVersionUID = -4779498858723606569L;
	
	//서비스 불러오기
	private User2Service service = User2Service.getInstance();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String uid = req.getParameter("uid");
		
		//수정 데이터 조회
		User2DTO dto = service.findUser2(uid);
		
		//데이터 공유
		req.setAttribute("dto", dto);		
		
		//view forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user2/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String addr = req.getParameter("addr");
		
		//DTO 생성
		User2DTO dto = new User2DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setAddr(addr);
		
		//서비스 호출
		service.registerUser2(dto);
		
		//이동
		resp.sendRedirect("/ch10/user2/list.do");
	}

}
