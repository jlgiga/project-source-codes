<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>FRS | Managing Flight Options</title>
  </head>
  <body onload="focusQueryInput();">
	<div id="templatmeo_header">
		<div id="templatemo_menu">
			<ul>
				<li><g:link controller="clerk" action="adminManage" class="current">Manage Flights</g:link></li>
				<li><g:link controller="clerk" action="account">Account</g:link></li>
				<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
			</ul>    	
		</div>
	</div>
	
	<div id="templatemo_main">
		<div id="templatemo_banner">
        
				<g:link controller="clerk" action="index" class="option">Cashier</g:link>
		
            	<g:link controller="airplane" action="index" class="option">Airplane</g:link>

            	<g:link controller="route" action="index" class="option">Route</g:link>
 
            	<g:link controller="travelClass" action="index" class="option">TravelClass</g:link>

            	<g:link controller="flight" action="index" class="option">Flight</g:link>
        </div>

	</div>
  </body>
</html>