
<%@ page import="com.project.frs.Flight" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="templatmeo_header">
		<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="clerk" action="adminManage">Manage Flights</g:link></li>
					<li><g:link controller="flight" action="aboutFlights">Account</g:link></li>
					<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
				</ul>    	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="list-flight" class="content scaffold-list" role="main">
			<h3><u><g:message code="default.list.label" args="[entityName]" /></u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="flightNumber" title="${message(code: 'flight.flightNumber.label', default: 'Flight Number')}" />
					
						<g:sortableColumn property="departureDate" title="${message(code: 'flight.departureDate.label', default: 'Departure Date')}" />
					
						<g:sortableColumn property="departureTime" title="${message(code: 'flight.departureTime.label', default: 'Departure Time')}" />
					
						<g:sortableColumn property="arrivalTime" title="${message(code: 'flight.arrivalTime.label', default: 'Arrival Time')}" />
					
						<g:sortableColumn property="availableSeats" title="${message(code: 'flight.availableSeats.label', default: 'Available Seats')}" />
					
						<th><g:message code="flight.airplane.label" default="Airplane" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flightInstanceList}" status="i" var="flightInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flightInstance.id}">${fieldValue(bean: flightInstance, field: "flightNumber")}</g:link></td>
					
						<td><g:formatDate date="${flightInstance.departureDate}" /></td>
					
						<td>${fieldValue(bean: flightInstance, field: "departureTime")}</td>
					
						<td>${fieldValue(bean: flightInstance, field: "arrivalTime")}</td>
					
						<td>${fieldValue(bean: flightInstance, field: "availableSeats")}</td>
					
						<td>${fieldValue(bean: flightInstance, field: "airplane")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flightInstanceTotal}" />
			</div>
			</div>
		</div>
	</body>
</html>
