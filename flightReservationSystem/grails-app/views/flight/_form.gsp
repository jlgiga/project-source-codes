<%@ page import="com.project.frs.Flight" %>



<!--<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'flightNumber', 'error')} required">
	<label for="flightNumber">
		<g:message code="flight.flightNumber.label" default="Flight Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="flightNumber" required="" value="${flightInstance?.flightNumber}"/>
</div>-->

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureDate', 'error')} required">
	<label for="departureDate">
		<g:message code="flight.departureDate.label" default="Departure Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="departureDate" precision="day" years="${2013..2030}" value="${flightInstance?.departureDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureTime', 'error')} required">
	<label for="departureTime">
		<g:message code="flight.departureTime.label" default="Departure Time" />
		<span class="required-indicator">*</span>
	</label>
	<!--<g:textField name="departureTime" required="" value="${flightInstance?.departureTime}"/>-->
	<joda:timeField name="departureTime" required="" value="${flightInstance?.departureTime}" />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalTime', 'error')} required">
	<label for="arrivalTime">
		<g:message code="flight.arrivalTime.label" default="Arrival Time" />
		<span class="required-indicator">*</span>
	</label>
	<!--<g:textField name="arrivalTime" required="" value="${flightInstance?.arrivalTime}"/>-->
	<joda:timeField name="arrivalTime" required="" value="${flightInstance?.arrivalTime}" />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'availableSeats', 'error')} required">
	<label for="availableSeats">
		<g:message code="flight.availableSeats.label" default="Available Seats" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="availableSeats" min="20" required="" value="${flightInstance.availableSeats}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'airplane', 'error')} required">
	<label for="airplane">
		<g:message code="flight.airplane.label" default="Airplane" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="airplane" name="airplane.id" from="${com.project.frs.Airplane.list()}" optionKey="id" required="" value="${flightInstance?.airplane?.id}" class="many-to-one"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'fightBooking', 'error')} ">
	<label for="fightBooking">
		<g:message code="flight.fightBooking.label" default="Fight Booking" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${flightInstance?.fightBooking?}" var="f">
    <li><g:link controller="flightBooking" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flightBooking" action="create" params="['flight.id': flightInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flightBooking.label', default: 'FlightBooking')])}</g:link>
</li>
</ul>

</div>-->

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'route', 'error')} required">
	<label for="route">
		<g:message code="flight.route.label" default="Route" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="route" name="route.id" from="${com.project.frs.Route.list()}" optionKey="id" required="" value="${flightInstance?.route?.id}" class="many-to-one"/>
</div>

