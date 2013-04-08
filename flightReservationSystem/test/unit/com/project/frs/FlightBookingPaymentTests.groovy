package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(FlightBookingPayment)
class FlightBookingPaymentTests {

	FlightBookingPayment flightBookingPayment;
    void testSomething() {
       fail "Implement me"
    }
	
	public void testSetAndGetPaymentAmount() {
		BigDecimal testPaymentAmount = 1000.00
		assertNull(flightBookingPayment.getPaymentAmount());
		flightBookingPayment.setPaymentAmount(testPaymentAmount);
		assertEquals(testPaymentAmount, flightBookingPayment.getPaymentAmount());
	}
	
	public void testSetAndGetDateCreated() {
		Date testDateCreated = new Date();
		assertNull(flightBookingPayment.getDateCreated());
		flightBookingPayment.setDateCreated(testDateCreated());
		assertEquals(testDateCreated, flightBookingPayment.getDateCreated());
	}
	
	public void testSetAndGetLastUpdated() {
		Date testLastUpdated = new Date();
		assertNull(flightBookingPayment.getLastUpdated());
		flightBookingPayment.setLastUpdated(testLastUpdated);
		assertEquals(testLastUpdated, flightBookingPayment.getLastUpdated());
	}
	
	
}
