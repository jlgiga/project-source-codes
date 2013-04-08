package com.project.frs

class Airplane {
	String airplaneType
	int noOfSeats
	
	static hasMany = [flight:Flight]
	
    static constraints = {
		airplaneType unique: true, blank: false
		noOfSeats blank: false, min: 20
    }
	
	String toString() {
		"${airplaneType}: ${noOfSeats}"
	}
}