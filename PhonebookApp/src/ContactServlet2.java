

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class ContactServlet2
 */
@WebServlet("/ContactServlet2")
public class ContactServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactController contactController = new ContactController();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Contact contact = new Contact();
		String option, name, forward="";
		
		option = request.getParameter("option");
		
		if(option.equalsIgnoreCase("name")) {
			name = request.getParameter("search");
			contactController.searchByName(name);
			forward = "/searchResult.jsp";
		}
		RequestDispatcher page = request.getRequestDispatcher(forward);
	    page.forward(request, response);
		
	}

}
