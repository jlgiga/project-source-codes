<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PhoneBook Application</title>
</head>
<body bgcolor="black">
	<center><table border="2" cellpadding="2" cellspacing="5">
		<thead>
			<tr>
				<th><font face="Calibri" color="white">Name</font></th>
				<th><font face="Calibri" color="white">Contact Number</font></th>
				<th><font face="Calibri" color="white">Email</font></th>
				<th colspan="2"><font face="Calibri" color="white">WTD</font></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${contacts}" var="contact" >
				<tr>
					<td><font color="pink" face="calibri"><c:out value="${contact.name}" /></font></td>
					<td><font color="pink" face="calibri"><c:out value="${contact.contactNum}" /></font></td>
					<td><font color="pink" face="calibri"><c:out value="${contact.email}" /></font></td>
					<td><font color="pink" face="calibri"><a href="ContactServlet?wtd=delete&id=<c:out value="${contact.id}" />">DELETE</a></font></td>
					<td><font color="pink" face="calibri"><a href="ContactServlet?wtd=update&id=<c:out value="${contact.id}" />">UPDATE</a></font></td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table><font color="pink" face="calibri">
	<a href="ContactServlet?wtd=insert">Add New Contact</a></font></center>
	<br><br>
	<!--<center><form action="ContactServlet2" method="post" >
	
		<font face="calibri" color="white">SEARCH by:</font> 
		<select name="option">
			<option>name</option>
			<option>contact number</option>
			<option>email</option>
		</select>
		
		<input type="text" name="search" />
		<input type="submit" value="Search" />
	</form></center>-->
</body>
</html>