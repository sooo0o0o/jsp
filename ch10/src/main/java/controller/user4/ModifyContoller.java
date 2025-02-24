package controller.user4;

import java.io.IOException;

import dto.User4DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User4Service;

@WebServlet("/user4/modify.do")
public class ModifyContoller extends HttpServlet {

	private static final long serialVersionUID = 5110263817907050311L;
	private User4Service service = User4Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		
		//수정 데이터 조회
		User4DTO dto = service.findUser4(uid);
		
		//데이터 공유
		req.setAttribute("dto", dto);
		
		//view forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user4/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		
		//DTO 생성
		User4DTO dto = new User4DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setHp(hp);
		dto.setAddr(addr);
		
		//서비스 호출
		service.modifyUser4(dto);
		
		//이동
		resp.sendRedirect("/ch10/user4/list.do");
	}
	

}
