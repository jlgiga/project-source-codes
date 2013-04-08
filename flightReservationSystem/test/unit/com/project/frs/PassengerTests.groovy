package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Passenger)
class PassengerTests {
	Passenger passenger
    void testSomething() {
       fail "Implement me"
    }
	
	public void testSetAndGetPassengerType() {
		String testPassengerType = "adult"
		assertNull(passenger.getPassengerType())
		passenger.setPassengerType(testPassengerType())
		assertEquals(testPassengerType, passenger.getPassengerType())
	}
	
	public void testSetAndGetGender() {
		String testGender = "female"
		assertNull(passenger.getGender())
		passenger.setGender(testGender)
		assertEquals(testGender, passenger.getGender())
	}
	
	public void testSetAndGetGivenName() {
		String testGivenName = "eunice"
		assertNull(passenger.getGivenName())
		passenger.setGivenName(testGivenName)
		assertEquals(testGivenName, passenger.getGivenName())
	}
	
	public void testSetAndGetSurname() {
		String testSurname ="ruiz"
		assertNull(passenger.getSurname())
		passenger.setSurname(testSurname);
		assertEquals(testSurname, passenger.getSurname())
	}
	
	public void testSetAndGetSuffix() {
		String testSuffix = "md"
		assertNull(passenger.getSuffix())
		passenger.setSuffix(testSuffix)
		assertEquals(testSuffix, passenger.getSuffix())
	}
	
	public void testSetAndGetEmail() {
		String testEmail = "euniciamayeruiz@gmail.com"
		assertNull(passenger.getEmail())
		passenger.setEmail(testEmail)
		assertEquals(testEmail, passenger.getEmail())
	}
	
	public void testSetAndGetHomePhoneNo() {
		String testHomeNo = "222-222"
		assertNull(passenger.getHomePhoneNo())
		passenger.setHomePhoneNo(testHomeNo)
		assertEquals(testHomeNo, passenger.getHomePhoneNo())
	}
	
	public void testSetAndGetBusinessPhoneNo() {
		String testBusinessNo = "221-221"
		assertNull(passenger.getBusinessPhoneNo())
		passenger.setBusinessPhoneNo(testBusinessNo)
		assertEquals(testBusinessNo, passenger.getBusinessPhoneNo())
	}
	
	public void testSetAndGetMobileNo() {
		String testMobileNo = "221-222"
		assertNull(passenger.getMobileNo())
		passenger.setMobileNo(testMobileNo)
		assertEquals(testMobileNo, passenger.getMobileNo())
	}
}
