
<%@ page import="com.project.frs.Flight" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="show-flight" class="content scaffold-show" role="main">
			<h3><u><g:message code="default.show.label" args="[entityName]" /></u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flight">
			
				<g:if test="${flightInstance?.flightNumber}">
				<li class="fieldcontain">
					<span id="flightNumber-label" class="property-label"><g:message code="flight.flightNumber.label" default="Flight Number" /></span>
					
						<span class="property-value" aria-labelledby="flightNumber-label"><g:fieldValue bean="${flightInstance}" field="flightNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.departureDate}">
				<li class="fieldcontain">
					<span id="departureDate-label" class="property-label"><g:message code="flight.departureDate.label" default="Departure Date" /></span>
					
						<span class="property-value" aria-labelledby="departureDate-label"><g:formatDate date="${flightInstance?.departureDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.departureTime}">
				<li class="fieldcontain">
					<span id="departureTime-label" class="property-label"><g:message code="flight.departureTime.label" default="Departure Time" /></span>
					
						<span class="property-value" aria-labelledby="departureTime-label"><g:fieldValue bean="${flightInstance}" field="departureTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.arrivalTime}">
				<li class="fieldcontain">
					<span id="arrivalTime-label" class="property-label"><g:message code="flight.arrivalTime.label" default="Arrival Time" /></span>
					
						<span class="property-value" aria-labelledby="arrivalTime-label"><g:fieldValue bean="${flightInstance}" field="arrivalTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.availableSeats}">
				<li class="fieldcontain">
					<span id="availableSeats-label" class="property-label"><g:message code="flight.availableSeats.label" default="Available Seats" /></span>
					
						<span class="property-value" aria-labelledby="availableSeats-label"><g:fieldValue bean="${flightInstance}" field="availableSeats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.airplane}">
				<li class="fieldcontain">
					<span id="airplane-label" class="property-label"><g:message code="flight.airplane.label" default="Airplane" /></span>
					
						<span class="property-value" aria-labelledby="airplane-label"><g:link controller="airplane" action="show" id="${flightInstance?.airplane?.id}">${flightInstance?.airplane?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.fightBooking}">
				<li class="fieldcontain">
					<span id="fightBooking-label" class="property-label"><g:message code="flight.fightBooking.label" default="Fight Booking" /></span>
					
						<g:each in="${flightInstance.fightBooking}" var="f">
						<span class="property-value" aria-labelledby="fightBooking-label"><g:link controller="flightBooking" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.route}">
				<li class="fieldcontain">
					<span id="route-label" class="property-label"><g:message code="flight.route.label" default="Route" /></span>
					
						<span class="property-value" aria-labelledby="route-label"><g:link controller="route" action="show" id="${flightInstance?.route?.id}">${flightInstance?.route?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${flightInstance?.id}" class="more"/>
					<g:link class="edit" action="edit" id="${flightInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
