
<%@ page import="com.project.frs.FlightBookingPayment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flightBookingPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flightBookingPayment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flightBookingPayment">
			
				<g:if test="${flightBookingPaymentInstance?.paymentAmount}">
				<li class="fieldcontain">
					<span id="paymentAmount-label" class="property-label"><g:message code="flightBookingPayment.paymentAmount.label" default="Payment Amount" /></span>
					
						<span class="property-value" aria-labelledby="paymentAmount-label"><g:fieldValue bean="${flightBookingPaymentInstance}" field="paymentAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingPaymentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="flightBookingPayment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${flightBookingPaymentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingPaymentInstance?.flightBooking}">
				<li class="fieldcontain">
					<span id="flightBooking-label" class="property-label"><g:message code="flightBookingPayment.flightBooking.label" default="Flight Booking" /></span>
					
						<span class="property-value" aria-labelledby="flightBooking-label"><g:link controller="flightBooking" action="show" id="${flightBookingPaymentInstance?.flightBooking?.id}">${flightBookingPaymentInstance?.flightBooking?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightBookingPaymentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="flightBookingPayment.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${flightBookingPaymentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${flightBookingPaymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${flightBookingPaymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
