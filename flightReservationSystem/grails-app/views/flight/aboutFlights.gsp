<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>List of Available Flights</title>
  </head>
  <body onload="focusQueryInput();">
	<div id="templatmeo_header">
		<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">HOME</a></h1></div>
		<div id="templatemo_menu">
			<ul>
				<li><g:link controller="flight" action="aboutFlights" class="current">Flights</g:link></li>
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
	<div id="templatemo_middle_sub">
		<div id="mid_title"></div>
		<div id="templatemo_banner">
			<div id="banner_left">
				<h2>Flights</h2>
				<p>Check for flight advisories, actual flight status online etc.</p>
				<div class="cleaner_h20"></div>
			</div>
			
			<div id="banner_right">
				<div class="banner_button">
					<g:link controller="airplane" action="searchFlights" class="option">Book a Flight</g:link>
				</div>
				
				<div class="banner_button">
					<g:link controller="airplane" action="searchFlights" class="option">Flight Status</g:link>
				</div>
				
				<div class="banner_button">
					<g:link controller="airplane" action="searchFlights" class="option">Seat Map</g:link>
				</div>
			</div>
		</div>
		<p></p>
	</div>
	<div id="templatemo_main">
	</div>
  </body>
</html>