
<%@ page import="com.project.frs.Clerk" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clerk.label', default: 'Clerk')}" />
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
		<div id="list-clerk" class="content scaffold-list" role="main">
			<h3><u><g:message code="default.list.label" args="[entityName]" /></u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'clerk.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'clerk.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'clerk.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="contactNo" title="${message(code: 'clerk.contactNo.label', default: 'Contact No')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'clerk.birthdate.label', default: 'Birthdate')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'clerk.address.label', default: 'Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clerkInstanceList}" status="i" var="clerkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clerkInstance.id}">${fieldValue(bean: clerkInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: clerkInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: clerkInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: clerkInstance, field: "contactNo")}</td>
					
						<td>${fieldValue(bean: clerkInstance, field: "birthdate")}</td>
					
						<td>${fieldValue(bean: clerkInstance, field: "address")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clerkInstanceTotal}" />
			</div>
			</div>
			</div>
		</div>
	</body>
</html>
