
<%@ page import="com.project.frs.Clerk" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clerk.label', default: 'Clerk')}" />
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
			<div id="mid_title"><g:message code="default.show.label" args="[entityName]" /></div>
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<p></p>
		</div>
		<div id="templatemo_main">
		<div id="show-clerk" class="content scaffold-show" role="main">
			<h3><u>Clerk Information</u></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clerk">
			
				<g:if test="${clerkInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="clerk.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${clerkInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="clerk.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${clerkInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="clerk.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${clerkInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.contactNo}">
				<li class="fieldcontain">
					<span id="contactNo-label" class="property-label"><g:message code="clerk.contactNo.label" default="Contact No" /></span>
					
						<span class="property-value" aria-labelledby="contactNo-label"><g:fieldValue bean="${clerkInstance}" field="contactNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="clerk.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:fieldValue bean="${clerkInstance}" field="birthdate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="clerk.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${clerkInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="clerk.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clerkInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="clerk.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${clerkInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="clerk.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${clerkInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="clerk.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${clerkInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="clerk.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${clerkInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clerkInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="clerk.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${clerkInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clerkInstance?.id}" />
					<g:link class="edit" action="edit" id="${clerkInstance?.id}" class="more"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
			</div>
		</div>
	</body>
</html>
