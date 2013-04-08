
<%@ page import="com.project.frs.Route" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'route.label', default: 'Route')}" />
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
		<div id="show-route" class="content scaffold-show" role="main">
			<h3><u>Route Information</u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list route">
			
				<g:if test="${routeInstance?.origin}">
				<li class="fieldcontain">
					<span id="origin-label" class="property-label"><g:message code="route.origin.label" default="Origin" /></span>
					
						<span class="property-value" aria-labelledby="origin-label"><g:fieldValue bean="${routeInstance}" field="origin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.destination}">
				<li class="fieldcontain">
					<span id="destination-label" class="property-label"><g:message code="route.destination.label" default="Destination" /></span>
					
						<span class="property-value" aria-labelledby="destination-label"><g:fieldValue bean="${routeInstance}" field="destination"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="route.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${routeInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.flight}">
				<li class="fieldcontain">
					<span id="flight-label" class="property-label"><g:message code="route.flight.label" default="Flight" /></span>
					
						<g:each in="${routeInstance.flight}" var="f">
						<span class="property-value" aria-labelledby="flight-label"><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${routeInstance?.id}" />
					<g:link class="edit" action="edit" id="${routeInstance?.id}" class="more"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
