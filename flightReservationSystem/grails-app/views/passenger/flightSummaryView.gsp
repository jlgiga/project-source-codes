<%@ page defaultCodec="html" %>
<%@ page import="com.project.frs.FlightBooking" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>List of Available Flights</title>
  </head>
  <body onload="focusQueryInput();">
	<div id="templatmeo_header">
		<div id="site_title"><h1><a href="http://localhost:8080/flightReservationSystem">Free CSS Templates</a></h1></div>
		<div id="templatemo_menu">
			<ul>
				<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
				<li><a href="blog.html">Travel Planner</a></li>
				<li><a href="contact.html">Contact Us</a></li>
				<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
			</ul>    	
		</div>
	</div>
	<div id="templatemo_middle_sub_flightList">
		<div id="mid_title">Flight Summary</div>
		<p>Flight Reservation is successful. Your Flight summary is shown below.</p>
		<p>As you can see, your PAYMENT STATUS is still stated as RESERVED. So the next thing your going to do is to pay for your flight reservation at the nearest flight ticketing outlets.</p>
	</div>
	<div id="templatemo_main">
		  <br/><br/>
		  <p>Flight Details</p>
		  <table>
				<thead>
					<tr>
						<th>Flight Number</th>
						<th>Origin</th>
						<th>Destination</th>
						<th>Departure Date</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${result2}" status="i" var="rs">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${rs.flight_number}</td>
							<td>${result3[0].origin}</td>
							<td>${result3[0].destination}</td>
							<td>${rs.departureDate}</td>
							<td>${rs.departure_time}</td>
							<td>${rs.arrival_time}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<br/>
		  <p>Payment Details</p>
		  <table>
				<thead>
					<tr>
						<th>BookingCode</th>
						<th>Payment Status</th>
						<th>Total Amount</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${result2}" status="i" var="res">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${res.booking_code}</td>
							<td>${res.payment_status}</td>
							<td>${res.payment_amount}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
				
			<br/>
		  <p>Passenger Details</p>
		  <table>
				<tbody>
					<g:each in="${result1}" status="i" var="resu">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>Passenger Type</td>
							<td>${resu.passenger_type}</td>
						</tr>
							<td>Name</td>
							<td>${resu.surname}, ${resu.given_name} ${resu.suffix}.</td>
						</tr>
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>Gender</td>
							<td>${resu.gender}</td>
						</tr>
						<tr>
							<td>Email</td>
							<td>${resu.email}</td>
						</tr>
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>Mobile No.</td>
							<td>${resu.mobile_no}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<br/><br/>
			<a href="${createLink(uri: '/')}" class="more">Back</a>
	</div>
  </body>
</html>