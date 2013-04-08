package com.project.frs

class FlightBooking {
	String bookingCode
	Date dateCreated
	Date lastUpdated
	String paymentStatus
	FlightBookingPayment flightBookingPayment
	
	static belongsTo = [flight: Flight, travelClass: TravelClass, customer: Customer]
	static hasMany = [passenger: Passenger]
	
    static constraints = {
		customer nullable: true
		flightBookingPayment nullable: true
		travelClass nullable: true
		flight nullable: true
		passenger nullable: true
		paymentStatus inList:["RESERVED", "CONFIRMED"]
    }
	
	String toString() {
		"${bookingCode}"
	}
}