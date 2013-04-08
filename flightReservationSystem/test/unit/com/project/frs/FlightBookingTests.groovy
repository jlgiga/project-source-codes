package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(FlightBooking)
class FlightBookingTests {

	private FlightBooking flightBooking
    void testSomething() {
       fail "Implement me"
    }
	
	public void testSetAndGetBookingCode(){
		String testBookingCode = "AB123"
		assertNull(flightBooking.getBookingCode());
		flightBooking.setBookingCode(testBookingCode);
		assertEquals(testBookingCode, flightBooking.getBookingCode());
	}
	
	public void testSetAndGetDateCreated() {
		Date testDateCreated = new Date();
		assertNull(flightBooking.getDateCreated());
		flightBooking.setDateCreated(testDateCreated);
		assertEquals(testDateCreated, flightBooking.getDateCreated());
	}
	
	public void testSetAndGetLastUpdated() {
		Date testLastUpdated = new Date();
		assertNull(flightBooking.getLastUpdated());
		flightBooking.setLastUpdated(testLastUpdated);
		assertEquals(testLastUpdated, flightBooking.getLastUpdated());
	}
	
	public void testSetAndGetPaymentStatus() {
		String testPaymentStatus = "reserved";
		assertNull(flightBooking.getPaymentStatus());
		flightBooking.setPaymentStatus(testPaymentStatus);
		assertEquals(testPaymentStatus, flightBooking.getPaymentStatus());
	}
	
	public void testSetAndGetFlightBookingPayment() {
		FlightBookingPayment bookingPayment = new FlightBookingPayment();
		bookingPayment.setPaymentAmount(1000.00);
		bookingPayment.setDateCreated(new Date());
		bookingPayment.setLastUpdate(new Date());
		
		assertNull(flightBooking.getFlightBookingPayment());
		flightBooking.setPaymentStatus(bookingPayment);
		assertEquals(bookingPayment, flightBooking.getFlightBookingPayment());
		
	}
}
