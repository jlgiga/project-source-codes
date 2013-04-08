<%@ page import="com.project.frs.Passenger" %>



<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'passengerType', 'error')} required">
	<label for="passengerType">
		<g:message code="passenger.passengerType.label" default="Passenger Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="passengerType" from="${passengerInstance.constraints.passengerType.inList}" required="" value="${passengerInstance?.passengerType}" valueMessagePrefix="passenger.passengerType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="passenger.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${passengerInstance.constraints.gender.inList}" required="" value="${passengerInstance?.gender}" valueMessagePrefix="passenger.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'givenName', 'error')} required">
	<label for="givenName">
		<g:message code="passenger.givenName.label" default="Given Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="givenName" required="" value="${passengerInstance?.givenName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'surname', 'error')} required">
	<label for="surname">
		<g:message code="passenger.surname.label" default="Surname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="surname" required="" value="${passengerInstance?.surname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'suffix', 'error')} ">
	<label for="suffix">
		<g:message code="passenger.suffix.label" default="Suffix" />
		
	</label>
	<g:textField name="suffix" value="${passengerInstance?.suffix}"/>
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
	<g:textField name="homePhoneNo" value="${passengerInstance?.homePhoneNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'businessPhoneNo', 'error')} ">
	<label for="businessPhoneNo">
		<g:message code="passenger.businessPhoneNo.label" default="Business Phone No" />
		
	</label>
	<g:textField name="businessPhoneNo" value="${passengerInstance?.businessPhoneNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'mobileNo', 'error')} required">
	<label for="mobileNo">
		<g:message code="passenger.mobileNo.label" default="Mobile No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mobileNo" required="" value="${passengerInstance?.mobileNo}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: passengerInstance, field: 'flightBooking', 'error')} required">
	<label for="flightBooking">
		<g:message code="passenger.flightBooking.label" default="Flight Booking" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="flightBooking" name="flightBooking.id" from="${com.project.frs.FlightBooking.list()}" optionKey="id" required="" value="${passengerInstance?.flightBooking?.id}" class="many-to-one"/>
</div>-->

<input type="hidden" name="flightBooking.id" value="${flightBookingInstance?.id}" />
