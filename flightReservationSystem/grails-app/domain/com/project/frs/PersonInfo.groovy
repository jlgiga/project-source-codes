package com.project.frs

class PersonInfo {
	
	String firstName
	String lastName
	String contactInfo
	String email
	String address
	Date dateOfBirth
	
    static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		contactInfo(blank:false)
		email(blank:false, email:true)
		dateOfBirth(blank:false)
	}
	
	String toString() {
		"${firstName} ${lastName}"
	}
}
