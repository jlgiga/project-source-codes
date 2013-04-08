<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Search Flights</title>
	<script type="text/javascript"></script> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
		});
	</script>
  </head>
  <body id="home">
		<div id="templatmeo_header">
			<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">Home</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFlights">Flights</g:link></li>
					<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
				</ul>
			</div>
		</div>
    
		<div id="templatemo_middle">
			<div id="search_flight_form">
				<div id="mid_title">Book a Flight</div>
					<g:form name="search" controller="flight" action="searchFlight">
						Trip Type: &nbsp;&nbsp;
						One Way <input onclick="document.getElementById('datepicker').disabled = false; document.getElementById('datepicker1').disabled = true;" type="radio" name="oneWay">&nbsp;&nbsp;&nbsp;&nbsp;
						Round Trip <input onclick="document.getElementById('datepicker').disabled = false; document.getElementById('datepicker1').disabled = false;" type="radio" name="type" value="roundTrip">
						<hr/><br/>
						Origin:
						<g:select name="origin" from="${['Manila', 'Cagayan de Oro']}" noSelection="['':'']"/>&nbsp;&nbsp;&nbsp;&nbsp;	
						Destination:
						<g:select name="destination" from="${['Manila', 'Cagayan de Oro', 'Cebu']}" noSelection="['':'']"/><br/><br/>
						Departing On:
						<input type="text" id="datepicker" name="departureDate"/></p>
						Arriving On:
						<input type="text" id="datepicker1" name="arrivalDate"/></p>
						<br/><br/>
						<input type="submit" value="Search" class="btn success" />
					</g:form>
				</div>
		</div>
  </body>
</html>