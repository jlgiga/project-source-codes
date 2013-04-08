<%@ page import="com.project.frs.Route" %>



<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="route.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="origin" from="${routeInstance.constraints.origin.inList}" required="" value="${routeInstance?.origin}" valueMessagePrefix="route.origin"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'destination', 'error')} required">
	<label for="destination">
		<g:message code="route.destination.label" default="Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="destination" from="${routeInstance.constraints.destination.inList}" required="" value="${routeInstance?.destination}" valueMessagePrefix="route.destination"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="route.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" step="any" min="500.00" required="" value="${routeInstance.amount}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'flight', 'error')} ">
	<label for="flight">
		<g:message code="route.flight.label" default="Flight" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${routeInstance?.flight?}" var="f">
    <li><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flight" action="create" params="['route.id': routeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flight.label', default: 'Flight')])}</g:link>
</li>
</ul>

</div>-->

