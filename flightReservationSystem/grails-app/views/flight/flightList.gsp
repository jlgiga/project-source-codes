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
				<li><g:link controller="flight" action="aboutFlights">Flights</g:link></li>
				<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
				<li><a href="blog.html">Travel Planner</a></li>
				<li><a href="contact.html">Contact Us</a></li>
				<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
			</ul>    	
		</div>
	</div>
	<div id="templatemo_middle_sub_flightList">
		<div id="mid_title">Select Your Flight and Travel Class</div>
		<p>The total price will INCLUDE government taxes and FRS surcharges. There may be additional fees for your checked baggage in excess of your free baggage allowance. The travel class is shown with amount.</p>
		<p>
		<b>Origin:</b> ${origin}&nbsp;&nbsp;&nbsp;&nbsp;
		<b>Departure</b> Date: ${departureDate}<br/>
		<b>Destination:</b> ${destination}&nbsp;&nbsp;
		</p>
		
	</div>
	<div id="templatemo_main">
		<g:form controller="flightBooking" action="save">
		  <p>Select Travel Class</p>
		  <g:each in="${travelClassInstance}" var="travelClass">
			<g:if test="${travelClass.description.equals("First")}">
				<input type="radio" name="travelClass.id" value="${travelClass.id}" checked=true/> ${travelClass.description} : ${travelClass.amount}
			</g:if>
			<g:elseif test="${travelClass.description.equals("Business")}">
				<input type="radio" name="travelClass.id" value="${travelClass.id}"/> ${travelClass.description} : ${travelClass.amount}
			</g:elseif>
			<g:else>
				<input type="radio" name="travelClass.id" value="${travelClass.id}"/> ${travelClass.description} : ${travelClass.amount}
			</g:else>
		  </g:each>
		  <br/><br/>
		  <p>Select Flight</p>
		  <table>
				<thead>
					<tr>
						<th>Flight Number</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
						<th>Available Seats</th>
						<th>Amount for Route</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${flightResult}" status="i" var="flight">
						<g:set var="id" value="flight.id" />
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:if test="${flight.available_seats == 0}">
							<th>${flight.flight_number}</th>
							<td>${flight.departure_time}</td>
							<td>${flight.arrival_time}</td>
							<td>${flight.available_seats}</td>
							<td>${flight.amount}</td>
						</g:if>
						<g:else>
							<th><input type="radio" name="flight.id" value="${flight.id}" checked="true"/> ${flight.flight_number}</th>
							<td>${flight.departure_time}</td>
							<td>${flight.arrival_time}</td>
							<td>${flight.available_seats}</td>
							<td>${flight.amount}</td>
						</g:else>
						</tr>
					</g:each>
				</tbody>
			</table>
			<br/><br/><br/>
			<g:if test="${id == null}">
				<a href="${createLink(uri: '/')}" class="more">New Search</a>
			</g:if>
			<g:else>
				<input type="submit" value="Next" onClick='checkButton()'/>
				<a href="${createLink(uri: '/')}" class="more">Back</a>
			</g:else>
		</g:form>
	</div>
  </body>
</html>