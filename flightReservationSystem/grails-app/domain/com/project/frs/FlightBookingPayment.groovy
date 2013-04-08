package com.project.frs

class FlightBookingPayment {
	BigDecimal paymentAmount
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [flightBooking: FlightBooking]
	
    static constraints = {
		paymentAmount blank: false
    }
	
	String toString() {
		"${flightBooking}-${paymentAmount}"
	}
}