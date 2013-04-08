
<%@ page import="com.project.frs.Passenger" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passenger.label', default: 'Passenger')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-passenger" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-passenger" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="passengerType" title="${message(code: 'passenger.passengerType.label', default: 'Passenger Type')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'passenger.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="givenName" title="${message(code: 'passenger.givenName.label', default: 'Given Name')}" />
					
						<g:sortableColumn property="surname" title="${message(code: 'passenger.surname.label', default: 'Surname')}" />
					
						<g:sortableColumn property="suffix" title="${message(code: 'passenger.suffix.label', default: 'Suffix')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'passenger.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${passengerInstanceList}" status="i" var="passengerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${passengerInstance.id}">${fieldValue(bean: passengerInstance, field: "passengerType")}</g:link></td>
					
						<td>${fieldValue(bean: passengerInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: passengerInstance, field: "givenName")}</td>
					
						<td>${fieldValue(bean: passengerInstance, field: "surname")}</td>
					
						<td>${fieldValue(bean: passengerInstance, field: "suffix")}</td>
					
						<td>${fieldValue(bean: passengerInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${passengerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
