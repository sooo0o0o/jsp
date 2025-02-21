package controller.user3;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/user3/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 6479081701644684549L;
	private User3Service service = User3Service.getInstance();

}
