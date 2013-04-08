package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Flight)
class FlightTests 

	private Flight flight

	public void testSetAndGetFlightNumber() {
		String testFlightNumber = "ABCD";
		assertNull(flight.getFlightNumber());
		flight.setFlightNumber(testFlightNumber);
		assertEquals(testFlightNumber,flight.getFlightNumber());
	}
	
	public void testSetAndGetDepartureDate() {
		Date testDepartureDate = "2013-30-03";
		assertNull(flight.getDepartureDate());
		flight.setDepartureDate(testDepartureDate);
		assertEquals(testDepartureDate,flight.getDepartureDate());
	}
	
	public void testSetAndGetDepartureTime() {
		String testDepartureTime = "10:30 AM";
		assertNull(flight.getDepartureTime());
		flight.setDepartureTime(testDepartureTime);
		assertEquals(testDepartureTime,flight.getDepartureTime());
	}
	
	public void testSetAndGetArrivalTime() {
		String testArrivalTime = "11:30 AM";
		assertNull(flight.getArrivalTime());
		flight.setArrivalTime(testArrivalTime);
		assertEquals(testArrivalTime,flight.getArrivalTime());
	}
	
	public void testSetAndGetAvailableSeats() {
		int testAvailableSeats = 25;
		assertNull(flight.getAvailableSeats());
		flight.setAvailableSeats(testAvailableSeats);
		assertEquals(testAvailableSeats,flight.getAvailableSeats());
	}
	
	

    void testSomething() {
       fail "Implement me"
    }
}
