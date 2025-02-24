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

@WebServlet("/user4/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 5110263837907050311L;
	private User4Service service = User4Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//view forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user4/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("uid");
		String gender = req.getParameter("uid");
		String age = req.getParameter("uid");
		String hp = req.getParameter("uid");
		String addr = req.getParameter("uid");
		
		//DTO
		User4DTO dto = new User4DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setHp(hp);
		dto.setAddr(addr);
		
		//서비스 호출
		service.registerUser4(dto);
		
		//이동
		resp.sendRedirect("/ch10/user4/list.do");
		
	}
	

}
