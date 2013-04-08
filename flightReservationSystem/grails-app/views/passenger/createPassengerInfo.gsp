<%@ page defaultCodec="html" %>
<%@ page import="com.project.frs.FlightBooking" %>
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
					<input type="hidden" name="flightBooking.id" value="${flightBookingInstance?.id}" /><br/>
					
					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'passengerType', 'error')} required">
						<label for="passengerType">
							<g:message code="passenger.passengerType.label" default="Passenger Type" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="passengerType" from="${['Adult', 'Child', 'Infant']}"/><br/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'gender', 'error')} required">
						<label for="gender">
							<g:message code="passenger.gender.label" default="Gender" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="gender" from="${['Male', 'Female']}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'givenName', 'error')} required">
						<label for="givenName">
							<g:message code="passenger.givenName.label" default="Given Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="givenName" value="${passengerInstance?.firstName}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'surname', 'error')} required">
						<label for="surname">
							<g:message code="passenger.surname.label" default="Surname" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="surname" value="${passengerInstance?.lastName}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'suffix', 'error')} ">
						<label for="suffix">
							<g:message code="passenger.suffix.label" default="Suffix" />
							
						</label>
						<g:textField name="suffix" value="${params.suffix}"/>
					</div>
					
					
					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="passenger.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="email" required="" value="${passengerInstance?.email}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'homePhoneNo', 'error')} ">
						<label for="homePhoneNo">
							<g:message code="passenger.homePhoneNo.label" default="Home Phone No" />
							
						</label>
						<g:textField name="homePhoneNo" value="${params.homePhoneNo}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'businessPhoneNo', 'error')} ">
						<label for="businessPhoneNo">
							<g:message code="passenger.businessPhoneNo.label" default="Business Phone No" />
							
						</label>
						<g:textField name="businessPhoneNo" value="${params.businessPhoneNo}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'mobileNo', 'error')} required">
						<label for="mobileNo">
							<g:message code="passenger.mobileNo.label" default="Mobile No" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="mobileNo" required="" value="${params.mobileNo}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
					<g:link action="cancel" id="${flightBookingInstance?.id}" class="more">Cancel</g:link>
				</fieldset>
			</g:form>
	</div>
  </body>
</html>