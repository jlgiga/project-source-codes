package org.euniceruiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XmlServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
		System.out.println("XML Servlet called");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		out.println("Hello World from GET to " + username);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String fullName = request.getParameter("fullName");
		out.println("Hello World from POST to " + username);
		out.println("Hello World from Post to " +fullName);
		String profession = request.getParameter("profession");
		out.println("\nYou work as a " + profession);
		String[] location = request.getParameterValues("location");
		out.println("\nYou are now at "  + location.length + "locations");
		for(int i = 0; i<location.length; i++) {
			out.println("Place #" + i + ": " + location[i]);
		}
		
	}
}