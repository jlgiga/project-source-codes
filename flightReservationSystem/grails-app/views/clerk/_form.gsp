<%@ page import="com.project.frs.Clerk" %>



<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="clerk.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${clerkInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="clerk.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${clerkInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="clerk.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${clerkInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'contactNo', 'error')} required">
	<label for="contactNo">
		<g:message code="clerk.contactNo.label" default="Contact No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNo" required="" value="${clerkInstance?.contactNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="clerk.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthdate" required="" value="${clerkInstance?.birthdate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="clerk.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${clerkInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="clerk.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${clerkInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="clerk.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${clerkInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="clerk.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${clerkInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="clerk.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${clerkInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="clerk.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${clerkInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clerkInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="clerk.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${clerkInstance?.passwordExpired}" />
</div>

