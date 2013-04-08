package com.project.frs

class User {

	transient springSecurityService

	String username
	String password
	String email
	String firstName
	String lastName
	String contactNo
	String birthdate
	String address
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		firstName blank:false
		lastName blank: false
		contactNo blank: false
		birthdate blank: false
		address blank: false
		email blank: false, email: true
		password blank: false, password: true
	}

	static mapping = {
		table '`user`'
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
