package com.project.frs

class Passenger {
	String passengerType
	String gender
	String givenName
	String surname
	String suffix
	String email
	String homePhoneNo
	String businessPhoneNo
	String mobileNo
	
	static belongsTo = [flightBooking: FlightBooking]
	
    static constraints = {
		passengerType blank: false, inList:["Adult", "Child", "Infant"]
		gender blank: false, inList:["Male", "Female"]
		givenName blank: false
		surname blank: false
		suffix()
		email blank: false
		homePhoneNo()
		businessPhoneNo()
		mobileNo blank: false
    }
	
	String toString() {
		"${surname}, ${givenName}"
	}
}