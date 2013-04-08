<%@ page import="com.project.frs.TravelClass" %>



<div class="fieldcontain ${hasErrors(bean: travelClassInstance, field: 'travelClassDescription', 'error')} required">
	<label for="travelClassDescription">
		<g:message code="travelClass.travelClassDescription.label" default="Travel Class Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="travelClassDescription" required="" value="${travelClassInstance?.travelClassDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: travelClassInstance, field: 'travelClassAmount', 'error')} required">
	<label for="travelClassAmount">
		<g:message code="travelClass.travelClassAmount.label" default="Travel Class Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="travelClassAmount" step="any" min="100.00" required="" value="${travelClassInstance.travelClassAmount}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: travelClassInstance, field: 'flightBooking', 'error')} ">
	<label for="flightBooking">
		<g:message code="travelClass.flightBooking.label" default="Flight Booking" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${travelClassInstance?.flightBooking?}" var="f">
    <li><g:link controller="flightBooking" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flightBooking" action="create" params="['travelClass.id': travelClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flightBooking.label', default: 'FlightBooking')])}</g:link>
</li>
</ul>

</div>-->

