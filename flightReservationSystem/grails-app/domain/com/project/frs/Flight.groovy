package com.project.frs

class Flight {
	String flightNumber
	Date departureDate
	String departureTime
	String arrivalTime
	int availableSeats
	
	static belongsTo = [airplane: Airplane, route: Route]
	static hasMany = [fightBooking: FlightBooking]
     
	static constraints = {
		flightNumber  blank: false
		departureDate  blank: false, min: new Date()
		departureTime blank: false
		arrivalTime(validator: { val, obj ->
		   if (val == obj.properties['departureTime']) {
			  return 'validator.message'
		   }
		}, blank: false)
		availableSeats blank: false, min: 20
    }
	
	String toString() {
		"${flightNumber}"
	}
}
