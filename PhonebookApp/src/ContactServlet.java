

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.euniceruiz.phonebook.Contact;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactController contactController = new ContactController();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "", wtd;
		int id;
		
		wtd = request.getParameter("wtd");
		
		if(wtd.equalsIgnoreCase("delete")) {
				id = Integer.parseInt(request.getParameter("id"));
	            contactController.deleteContact(id);
	            forward = "/mainView.jsp";
	            request.setAttribute("contacts", contactController.displayAll());
		}
		else if(wtd.equalsIgnoreCase("update")) {
			forward = "/updateContact.jsp";
	        id = Integer.parseInt(request.getParameter("id"));
	        Contact contact = contactController.getContactById(id);
	        request.setAttribute("contact", contact);
		}
		else {
			forward = "/addContact.jsp";
		}
		
		  RequestDispatcher page = request.getRequestDispatcher(forward);
	      page.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Contact contact = new Contact();
		String id;
		
		try {
			id = request.getParameter("id");
			contact.setName(request.getParameter("name"));
			contact.setContactNum(request.getParameter("contactNum"));
			contact.setEmail(request.getParameter("email"));
			
			if(id == null || id.isEmpty()) {
				contactController.addContact(contact);
				
			}
			else {
				contact.setId(Integer.parseInt(id));
				contactController.updateContact(contact);
			}
		}
		catch(Throwable e) {
			System.out.println(e);
		}
		
		RequestDispatcher page = request.getRequestDispatcher("/mainView.jsp");
        request.setAttribute("contacts", contactController.displayAll());
        page.forward(request, response);
	}

}
