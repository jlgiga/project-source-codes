<%@ page import="com.project.frs.Airplane" %>



<div class="fieldcontain ${hasErrors(bean: airplaneInstance, field: 'airplaneType', 'error')} required">
	<label for="airplaneType">
		<g:message code="airplane.airplaneType.label" default="Airplane Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="airplaneType" required="" value="${airplaneInstance?.airplaneType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airplaneInstance, field: 'noOfSeats', 'error')} required">
	<label for="noOfSeats">
		<g:message code="airplane.noOfSeats.label" default="No Of Seats" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="noOfSeats" min="20" required="" value="${airplaneInstance.noOfSeats}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: airplaneInstance, field: 'flight', 'error')} ">
	<label for="flight">
		<g:message code="airplane.flight.label" default="Flight" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${airplaneInstance?.flight?}" var="f">
    <li><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flight" action="create" params="['airplane.id': airplaneInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flight.label', default: 'Flight')])}</g:link>
</li>
</ul>-->

</div>

