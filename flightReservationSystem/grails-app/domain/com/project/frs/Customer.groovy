package com.project.frs

class Customer extends User {
	
	static hasMany = [flightBooking:FlightBooking]
	
    static constraints = {
    }
	
	String toString() {
		"${flightBooking}"
	}
}