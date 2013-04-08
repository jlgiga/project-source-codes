package com.project.frs



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(PersonInfo)
class PersonInfoTests {
	PersonInfo personInfo
	
    void testSomething() {
       fail "Implement me"
    }
	
	public void testSetAndGetFirstName() {
		String testFirstName = "eunice"
		assertNull(personInfo.getFirstName())
		personInfo.setFirstName(testFirstName)
		assertEquals(testFirstName, personInfo.getFirstName())
	}
	
	public void testSetAndGetLastName() {
		String testLastName = "ruiz"
		assertNull(personInfo.getLastName())
		personInfo.setLastName(testLastName)
		assertEquals(testLastName, personInfo.getLastName())
	}
	
	
}
