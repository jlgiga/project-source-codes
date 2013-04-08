
<%@ page import="com.project.frs.Airplane" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'airplane.label', default: 'Airplane')}" />
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
		<div id="show-airplane" class="content scaffold-show" role="main">
			<h3><u>Airplane Information</u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list airplane">
			
				<g:if test="${airplaneInstance?.airplaneType}">
				<li class="fieldcontain">
					<span id="airplaneType-label" class="property-label"><g:message code="airplane.airplaneType.label" default="Airplane Type" /></span>
					
						<span class="property-value" aria-labelledby="airplaneType-label"><g:fieldValue bean="${airplaneInstance}" field="airplaneType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airplaneInstance?.noOfSeats}">
				<li class="fieldcontain">
					<span id="noOfSeats-label" class="property-label"><g:message code="airplane.noOfSeats.label" default="No Of Seats" /></span>
					
						<span class="property-value" aria-labelledby="noOfSeats-label"><g:fieldValue bean="${airplaneInstance}" field="noOfSeats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airplaneInstance?.flight}">
				<li class="fieldcontain">
					<span id="flight-label" class="property-label"><g:message code="airplane.flight.label" default="Flight" /></span>
					
						<g:each in="${airplaneInstance.flight}" var="f">
						<span class="property-value" aria-labelledby="flight-label"><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${airplaneInstance?.id}" />
					<g:link class="edit" action="edit" id="${airplaneInstance?.id}" class="more"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="more" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
