package controller.user4;

import java.io.IOException;
import java.util.List;

import dto.User4DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User4Service;

@WebServlet("/user4/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 5110263817807050311L;
	private User4Service service = User4Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자 조회
		List<User4DTO> dtos = service.FindAll();
		
		//데이터 공유
		req.setAttribute("dtos", dtos);
		
		//view forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user4/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	

}
