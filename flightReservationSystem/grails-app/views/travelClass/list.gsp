
<%@ page import="com.project.frs.TravelClass" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'travelClass.label', default: 'TravelClass')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="list-travelClass" class="content scaffold-list" role="main">
			<h3><u><g:message code="default.list.label" args="[entityName]" /></u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="travelClassDescription" title="${message(code: 'travelClass.travelClassDescription.label', default: 'Travel Class Description')}" />
					
						<g:sortableColumn property="travelClassAmount" title="${message(code: 'travelClass.travelClassAmount.label', default: 'Travel Class Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${travelClassInstanceList}" status="i" var="travelClassInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${travelClassInstance.id}">${fieldValue(bean: travelClassInstance, field: "travelClassDescription")}</g:link></td>
					
						<td>${fieldValue(bean: travelClassInstance, field: "travelClassAmount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${travelClassInstanceTotal}" />
			</div>
			</div>
		</div>
	</body>
</html>
