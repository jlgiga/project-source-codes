
<%@ page import="com.project.frs.FlightBookingPayment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flightBookingPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flightBookingPayment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="paymentAmount" title="${message(code: 'flightBookingPayment.paymentAmount.label', default: 'Payment Amount')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'flightBookingPayment.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="flightBookingPayment.flightBooking.label" default="Flight Booking" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'flightBookingPayment.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flightBookingPaymentInstanceList}" status="i" var="flightBookingPaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flightBookingPaymentInstance.id}">${fieldValue(bean: flightBookingPaymentInstance, field: "paymentAmount")}</g:link></td>
					
						<td><g:formatDate date="${flightBookingPaymentInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: flightBookingPaymentInstance, field: "flightBooking")}</td>
					
						<td><g:formatDate date="${flightBookingPaymentInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flightBookingPaymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
