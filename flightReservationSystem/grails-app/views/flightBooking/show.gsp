
<%@ page import="com.project.frs.FlightBooking" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flightBooking.label', default: 'FlightBooking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="templatmeo_header">
			<div id="site_title"><h1><a href="http://localhost:8080/flightReservationSystem">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFRS" class="current">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifAllGranted roles="ROLE_CUSTOMER">
						<li><g:link controller="customer" action="customerInfo">Account</g:link></li>
					</sec:ifAllGranted>
					<sec:ifLoggedIn>
						<li><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>    	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div id="mid_title">Flight Booking Information</div>
			<p></p>
		</div> <!-- end of middle -->
    
     <div id="templatemo_main">
		<div id="show-flightBooking" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flightBooking">
			
				<g:if test="${flightBookingInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="flightBooking.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${flightBookingInstance?.customer?.id}">${flightBookingInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.flightBookingPayment}">
				<li class="fieldcontain">
					<span id="flightBookingPayment-label" class="property-label"><g:message code="flightBooking.flightBookingPayment.label" default="Flight Booking Payment" /></span>
					
						<span class="property-value" aria-labelledby="flightBookingPayment-label"><g:link controller="flightBookingPayment" action="show" id="${flightBookingInstance?.flightBookingPayment?.id}">${flightBookingInstance?.flightBookingPayment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.travelClass}">
				<li class="fieldcontain">
					<span id="travelClass-label" class="property-label"><g:message code="flightBooking.travelClass.label" default="Travel Class" /></span>
					
						<span class="property-value" aria-labelledby="travelClass-label"><g:link controller="travelClass" action="show" id="${flightBookingInstance?.travelClass?.id}">${flightBookingInstance?.travelClass?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.flight}">
				<li class="fieldcontain">
					<span id="flight-label" class="property-label"><g:message code="flightBooking.flight.label" default="Flight" /></span>
					
						<span class="property-value" aria-labelledby="flight-label"><g:link controller="flight" action="show" id="${flightBookingInstance?.flight?.id}">${flightBookingInstance?.flight?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.passenger}">
				<li class="fieldcontain">
					<span id="passenger-label" class="property-label"><g:message code="flightBooking.passenger.label" default="Passenger" /></span>
					
						<g:each in="${flightBookingInstance.passenger}" var="p">
						<span class="property-value" aria-labelledby="passenger-label"><g:link controller="passenger" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.paymentStatus}">
				<li class="fieldcontain">
					<span id="paymentStatus-label" class="property-label"><g:message code="flightBooking.paymentStatus.label" default="Payment Status" /></span>
					
						<span class="property-value" aria-labelledby="paymentStatus-label"><g:fieldValue bean="${flightBookingInstance}" field="paymentStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.bookingCode}">
				<li class="fieldcontain">
					<span id="bookingCode-label" class="property-label"><g:message code="flightBooking.bookingCode.label" default="Booking Code" /></span>
					
						<span class="property-value" aria-labelledby="bookingCode-label"><g:fieldValue bean="${flightBookingInstance}" field="bookingCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="flightBooking.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${flightBookingInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="flightBooking.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${flightBookingInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			</div>
		</div>
	</body>
</html>
