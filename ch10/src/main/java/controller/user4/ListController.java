package controller.user4;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import service.User4Service;

@WebServlet("/user4/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 5110263817807050311L;
	private User4Service service = User4Service.getInstance();
	

}
