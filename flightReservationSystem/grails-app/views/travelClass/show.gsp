
<%@ page import="com.project.frs.TravelClass" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'travelClass.label', default: 'TravelClass')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="templatmeo_header">
		<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="clerk" action="adminManage">Manage Flights</g:link></li>
					<li><g:link controller="flight" action="aboutFlights">Account</g:link></li>
					<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
				</ul>    	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="show-travelClass" class="content scaffold-show" role="main">
			<h3><u><g:message code="default.show.label" args="[entityName]" /></u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list travelClass">
			
				<g:if test="${travelClassInstance?.travelClassDescription}">
				<li class="fieldcontain">
					<span id="travelClassDescription-label" class="property-label"><g:message code="travelClass.travelClassDescription.label" default="Travel Class Description" /></span>
					
						<span class="property-value" aria-labelledby="travelClassDescription-label"><g:fieldValue bean="${travelClassInstance}" field="travelClassDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${travelClassInstance?.travelClassAmount}">
				<li class="fieldcontain">
					<span id="travelClassAmount-label" class="property-label"><g:message code="travelClass.travelClassAmount.label" default="Travel Class Amount" /></span>
					
						<span class="property-value" aria-labelledby="travelClassAmount-label"><g:fieldValue bean="${travelClassInstance}" field="travelClassAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${travelClassInstance?.flightBooking}">
				<li class="fieldcontain">
					<span id="flightBooking-label" class="property-label"><g:message code="travelClass.flightBooking.label" default="Flight Booking" /></span>
					
						<g:each in="${travelClassInstance.flightBooking}" var="f">
						<span class="property-value" aria-labelledby="flightBooking-label"><g:link controller="flightBooking" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${travelClassInstance?.id}" />
					<g:link class="edit" action="edit" id="${travelClassInstance?.id}" class="more"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
