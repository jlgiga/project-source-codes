package com.project.frs

class TravelClass {
	String travelClassDescription
	BigDecimal travelClassAmount
	
	static hasMany = [flightBooking: FlightBooking]
	
    static constraints = {
		travelClassDescription blank: false, unique: true
		travelClassAmount blank: false, min: 100.00
	}
	
	String toString() {
		"${travelClassDescription}: ${travelClassAmount}"
	}
}