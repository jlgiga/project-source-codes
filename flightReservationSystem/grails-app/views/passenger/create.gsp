<%@ page import="com.project.frs.Passenger" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passenger.label', default: 'Passenger')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="templatmeo_header">
		<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFlights">Flights</g:link></li>
					<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<sec:ifAllGranted roles="ROLE_ADMIN">
								<li><g:link controller="clerk" action="adminManage">Manage Flights</g:link></li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_CASHIER">
								<li><g:link controller="flightBooking" action="searchBookingCode">Search Booking Code</g:link></li>
						</sec:ifAllGranted>
						<li><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>  	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div id="mid_title">Fill-up the fields below.</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="create-passenger" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${passengerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${passengerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:link action="cancel" id="${flightBookingInstance?.id}" class="more">Cancel</g:link>
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
