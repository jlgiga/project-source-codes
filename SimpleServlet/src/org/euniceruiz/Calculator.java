package org.euniceruiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "Calculates 2 numbers depending on what the operation chosen by the user.", urlPatterns = { "/CalculatorPath" })
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		double firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
		double secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
		
		String op = request.getParameter("op");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("op").equals("+"))
			out.println("Sum is: " + add(firstNumber, secondNumber));
		else if(request.getParameter("op").equals("-"))
			out.println("Difference is: " + subtract(firstNumber, secondNumber));
		else if(request.getParameter("op").equals("*"))
			out.println("Product is: " +multiply(firstNumber, secondNumber));
		else if(request.getParameter("op").equals("/"))
			out.println("Quotient is: " + divide(firstNumber, secondNumber));
		else if(request.getParameter("op").equals("^"))
			out.println(firstNumber + "to the power of " + secondNumber + "is: " + exponent(firstNumber, secondNumber));
	}
	
	protected double add(double first, double second) {
		double sum = first + second;
		return sum;
	}
	
	protected double multiply(double first, double second) {
		double product = first * second;
		return product;
	}
	
	protected double divide(double first, double second) {
		double quotient = first / second;
		return quotient;
	}
	
	protected double subtract(double first, double second) {
		double diff = first - second;
		return diff;
	}
	
	protected double exponent(double first, double second){
		double power = Math.pow(first, second);
		return power;
	}

}
