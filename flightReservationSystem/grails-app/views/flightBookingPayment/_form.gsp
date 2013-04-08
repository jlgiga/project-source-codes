<%@ page import="com.project.frs.FlightBookingPayment" %>



<div class="fieldcontain ${hasErrors(bean: flightBookingPaymentInstance, field: 'paymentAmount', 'error')} required">
	<label for="paymentAmount">
		<g:message code="flightBookingPayment.paymentAmount.label" default="Payment Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="paymentAmount" step="any" required="" value="${flightBookingPaymentInstance.paymentAmount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightBookingPaymentInstance, field: 'flightBooking', 'error')} required">
	<label for="flightBooking">
		<g:message code="flightBookingPayment.flightBooking.label" default="Flight Booking" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="flightBooking" name="flightBooking.id" from="${com.project.frs.FlightBooking.list()}" optionKey="id" required="" value="${flightBookingPaymentInstance?.flightBooking?.id}" class="many-to-one"/>
</div>

