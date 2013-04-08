<%@ page import="com.project.frs.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="customer.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${customerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="customer.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${customerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${customerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'contactNo', 'error')} required">
	<label for="contactNo">
		<g:message code="customer.contactNo.label" default="Contact No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNo" required="" value="${customerInstance?.contactNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="customer.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthdate" required="" value="${customerInstance?.birthdate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="customer.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${customerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="customer.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${customerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="customer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${customerInstance?.password}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="customer.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${customerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="customer.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${customerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="customer.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${customerInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'flightBooking', 'error')} ">
	<label for="flightBooking">
		<g:message code="customer.flightBooking.label" default="Flight Booking" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${customerInstance?.flightBooking?}" var="f">
    <li><g:link controller="flightBooking" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flightBooking" action="create" params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flightBooking.label', default: 'FlightBooking')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="customer.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${customerInstance?.passwordExpired}" />
</div>-->

