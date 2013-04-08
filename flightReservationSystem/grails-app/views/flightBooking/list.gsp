
<%@ page import="com.project.frs.FlightBooking" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flightBooking.label', default: 'FlightBooking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flightBooking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flightBooking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="flightBooking.customer.label" default="Customer" /></th>
					
						<th><g:message code="flightBooking.flightBookingPayment.label" default="Flight Booking Payment" /></th>
					
						<th><g:message code="flightBooking.travelClass.label" default="Travel Class" /></th>
					
						<th><g:message code="flightBooking.flight.label" default="Flight" /></th>
					
						<g:sortableColumn property="paymentStatus" title="${message(code: 'flightBooking.paymentStatus.label', default: 'Payment Status')}" />
					
						<g:sortableColumn property="bookingCode" title="${message(code: 'flightBooking.bookingCode.label', default: 'Booking Code')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flightBookingInstanceList}" status="i" var="flightBookingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flightBookingInstance.id}">${fieldValue(bean: flightBookingInstance, field: "customer")}</g:link></td>
					
						<td>${fieldValue(bean: flightBookingInstance, field: "flightBookingPayment")}</td>
					
						<td>${fieldValue(bean: flightBookingInstance, field: "travelClass")}</td>
					
						<td>${fieldValue(bean: flightBookingInstance, field: "flight")}</td>
					
						<td>${fieldValue(bean: flightBookingInstance, field: "paymentStatus")}</td>
					
						<td>${fieldValue(bean: flightBookingInstance, field: "bookingCode")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flightBookingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
