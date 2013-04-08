package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Airplane)
class AirplaneTests {
	
	private Airplane airplane
	
	public void testSetAndGetAirplaneType() {
		String testAirplaneType = "Cebu Pacific";
		assertNull(airplane.getAirplaneType());
		airplane.setAirplaneType(testAirplaneType);
		assertEquals(testAirplaneType,airplane.getAirplaneType());
	}
	
	public void testSetAndGetNoOfSeats() {
		int testNoOfSeats = 30;
		assertNull(airplane.getNoOfSeats());
		airplane.setNoOfSeats(testNoOfSeats);
		assertEquals(testNoOfSeats,airplane.getNoOfSeats());
	}
	
	

    void testSomething() {
       fail "Implement me"
    }
}
