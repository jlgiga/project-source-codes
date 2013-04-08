<%@ page import="com.project.frs.Customer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="templatmeo_header">
			<div id="site_title"><h1><a href="http://localhost:8080/flightReservationSystem">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFRS" class="current">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifAllGranted roles="ROLE_CUSTOMER">
						<li><g:link controller="customer" action="show">Account</g:link></li>
					</sec:ifAllGranted>
					<sec:ifLoggedIn>
						<li><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>    	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div id="mid_title">Edit your information below.</div>
			<p></p>
		</div> <!-- end of middle -->
		<div id="edit-customer" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${customerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${customerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${customerInstance?.id}" />
				<g:hiddenField name="version" value="${customerInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
