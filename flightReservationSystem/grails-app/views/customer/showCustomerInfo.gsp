<%@ page import="com.project.frs.Customer" %>
<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<html>
  <head>
	<meta name="layout" content="main"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>List of Available Flights</title>
  </head>
  <body onload="focusQueryInput();">
	<div id="templatmeo_header">
		<div id="site_title"><h1><a href="http://localhost:8080/flightReservationSystem">Free CSS Templates</a></h1></div>
		<div id="templatemo_menu">
			<ul>
				<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
				<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
				<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
			</ul>    	
		</div>
	</div>
	<div id="templatemo_middle_sub_flightList">
		<div id="mid_title">Fill-up the fields below.</div>
	</div>
	<div id="templatemo_main">
		<g:form method="post" >
				<fieldset class="form">

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
</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
				</fieldset>
			</g:form>
	</div>

