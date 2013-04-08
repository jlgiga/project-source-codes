<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Search Booking Code</title>
	</head>
	<body>
		<div id="templatmeo_header">
			<div id="site_title"><h1><a href="#">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flightBooking" action="searchBookingCode" class="current">Booking Code</g:link></li>
					<li><g:link controller="flight" action="aboutFlights" class="current">Account</g:link></li>
					<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
				</ul>    	
			</div>
		</div> <!-- end of header -->
		<div id="templatemo_middle_sub">
			<div id="mid_title">Search the Flight Booking Code</div>
			<p>Search the flight booking code given by a particular passenger for confirmation.</p>
		</div> <!-- end of middle -->
    
     <div id="templatemo_main_searchFlightBookingCode">
			<br/><br/>
			<g:form action="searchCode">
				Enter Flight Booking Code: <g:textField name="bookingCode" value="${params.bookingCode}"/>
				<br/><br/><br/>
				<g:submitButton name="searchBookingCode" class="save" value="Search" />
			</g:form>
			<br/><br/>
    </div>
	</body>
</html>
