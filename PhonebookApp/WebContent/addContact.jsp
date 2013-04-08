<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Contact</title>
</head>
<body bgcolor="black"><center>
	<form action="ContactServlet" method="post">
		<font face="calibri" color="white">Name: <input type="text" name="name" /><br><br>
		Contact Number: <input type="text" name="contactNum" /><br><br>
		Email: <input type="text" name="email"/> </font>
		<input type="submit" value="Add Contact"/>
	</form></center>
</body>
</html>