
<%@ page import="com.project.frs.Passenger" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passenger.label', default: 'Passenger')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-passenger" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-passenger" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list passenger">
			
				<g:if test="${passengerInstance?.passengerType}">
				<li class="fieldcontain">
					<span id="passengerType-label" class="property-label"><g:message code="passenger.passengerType.label" default="Passenger Type" /></span>
					
						<span class="property-value" aria-labelledby="passengerType-label"><g:fieldValue bean="${passengerInstance}" field="passengerType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="passenger.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${passengerInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.givenName}">
				<li class="fieldcontain">
					<span id="givenName-label" class="property-label"><g:message code="passenger.givenName.label" default="Given Name" /></span>
					
						<span class="property-value" aria-labelledby="givenName-label"><g:fieldValue bean="${passengerInstance}" field="givenName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.surname}">
				<li class="fieldcontain">
					<span id="surname-label" class="property-label"><g:message code="passenger.surname.label" default="Surname" /></span>
					
						<span class="property-value" aria-labelledby="surname-label"><g:fieldValue bean="${passengerInstance}" field="surname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.suffix}">
				<li class="fieldcontain">
					<span id="suffix-label" class="property-label"><g:message code="passenger.suffix.label" default="Suffix" /></span>
					
						<span class="property-value" aria-labelledby="suffix-label"><g:fieldValue bean="${passengerInstance}" field="suffix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="passenger.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${passengerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.homePhoneNo}">
				<li class="fieldcontain">
					<span id="homePhoneNo-label" class="property-label"><g:message code="passenger.homePhoneNo.label" default="Home Phone No" /></span>
					
						<span class="property-value" aria-labelledby="homePhoneNo-label"><g:fieldValue bean="${passengerInstance}" field="homePhoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.businessPhoneNo}">
				<li class="fieldcontain">
					<span id="businessPhoneNo-label" class="property-label"><g:message code="passenger.businessPhoneNo.label" default="Business Phone No" /></span>
					
						<span class="property-value" aria-labelledby="businessPhoneNo-label"><g:fieldValue bean="${passengerInstance}" field="businessPhoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.mobileNo}">
				<li class="fieldcontain">
					<span id="mobileNo-label" class="property-label"><g:message code="passenger.mobileNo.label" default="Mobile No" /></span>
					
						<span class="property-value" aria-labelledby="mobileNo-label"><g:fieldValue bean="${passengerInstance}" field="mobileNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${passengerInstance?.flightBooking}">
				<li class="fieldcontain">
					<span id="flightBooking-label" class="property-label"><g:message code="passenger.flightBooking.label" default="Flight Booking" /></span>
					
						<span class="property-value" aria-labelledby="flightBooking-label"><g:link controller="flightBooking" action="show" id="${passengerInstance?.flightBooking?.id}">${passengerInstance?.flightBooking?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${passengerInstance?.id}" />
					<g:link class="edit" action="edit" id="${passengerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
