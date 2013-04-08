<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Contact</title>
</head>
<body><center><form action="ContactServlet" method="post"><font face="calibri" color="white">
	
		ID: <input type="text" name="id" readonly="readonly" value="<c:out value="${contact.id}" />"/><br>
		Name: <input type="text" name="name" value="<c:out value="${contact.name}" />"/><br>
		Contact: <input type="text" name="contactNum" value="<c:out value="${contact.contactNum}" />"/>
<br>	Email: <input type="text" name="email" value="<c:out value="${contact.email}" />"/>
		<input type="submit" value="Update Contact"/>
	</font></form></center>
</body>
</html>