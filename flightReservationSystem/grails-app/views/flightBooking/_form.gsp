<%@ page import="com.project.frs.FlightBooking" %>



<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'customer', 'error')} ">
	<label for="customer">
		<g:message code="flightBooking.customer.label" default="Customer" />
		
	</label>
	<g:select id="customer" name="customer.id" from="${com.project.frs.Customer.list()}" optionKey="id" value="${flightBookingInstance?.customer?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'flightBookingPayment', 'error')} ">
	<label for="flightBookingPayment">
		<g:message code="flightBooking.flightBookingPayment.label" default="Flight Booking Payment" />
		
	</label>
	<g:select id="flightBookingPayment" name="flightBookingPayment.id" from="${com.project.frs.FlightBookingPayment.list()}" optionKey="id" value="${flightBookingInstance?.flightBookingPayment?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'travelClass', 'error')} ">
	<label for="travelClass">
		<g:message code="flightBooking.travelClass.label" default="Travel Class" />
		
	</label>
	<g:select id="travelClass" name="travelClass.id" from="${com.project.frs.TravelClass.list()}" optionKey="id" value="${flightBookingInstance?.travelClass?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'flight', 'error')} ">
	<label for="flight">
		<g:message code="flightBooking.flight.label" default="Flight" />
		
	</label>
	<g:select id="flight" name="flight.id" from="${com.project.frs.Flight.list()}" optionKey="id" value="${flightBookingInstance?.flight?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'passenger', 'error')} ">
	<label for="passenger">
		<g:message code="flightBooking.passenger.label" default="Passenger" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${flightBookingInstance?.passenger?}" var="p">
    <li><g:link controller="passenger" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="passenger" action="create" params="['flightBooking.id': flightBookingInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'passenger.label', default: 'Passenger')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'paymentStatus', 'error')} ">
	<label for="paymentStatus">
		<g:message code="flightBooking.paymentStatus.label" default="Payment Status" />
		
	</label>
	<g:select name="paymentStatus" from="${flightBookingInstance.constraints.paymentStatus.inList}" value="${flightBookingInstance?.paymentStatus}" valueMessagePrefix="flightBooking.paymentStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingInstance, field: 'bookingCode', 'error')} ">
	<label for="bookingCode">
		<g:message code="flightBooking.bookingCode.label" default="Booking Code" />
		
	</label>
	<g:textField name="bookingCode" value="${flightBookingInstance?.bookingCode}"/>
</div>

