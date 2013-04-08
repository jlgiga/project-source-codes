package com.project.frs

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql
import grails.plugins.springsecurity.*

class PassengerController {
	
	SpringSecurityService springSecurityService
	def dataSource
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [passengerInstanceList: Passenger.list(params), passengerInstanceTotal: Passenger.count()]
    }

    def create() {
        [passengerInstance: new Passenger(params), flightBookingInstance: FlightBooking.get(params.id)]
    }

    def save() {
        def passengerInstance = new Passenger(params)
        if (!passengerInstance.save(flush: true)) {
            render(view: "create", model: [passengerInstance: passengerInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'passenger.label', default: 'Passenger'), passengerInstance.id])
		//redirect(action: "show", id: passengerInstance.id)
		redirect(action: "flightSummary", id: passengerInstance.id)
    }

    def show() {
        def passengerInstance = Passenger.get(params.id)
        if (!passengerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "list")
            return
        }

        [passengerInstance: passengerInstance]
    }

    def edit() {
       def passengerInstance = Passenger.get(params.id)
        if (!passengerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "list")
            return
        }
		
        [passengerInstance: passengerInstance, flightBookingInstance: flightBookingInstance]
    }
	
	def passengerInfo = {
		def passengerInstance
		def userlogged = springSecurityService.getCurrentUser()
		def flightBookingInstance = FlightBooking.get(params.id)
		
		if(userlogged != null) {
			passengerInstance = User.get(springSecurityService.principal.id)
			render(view: "createPassengerInfo", model: [passengerInstance: passengerInstance, flightBookingInstance: flightBookingInstance])
		} else {
			redirect(action: "create", id: flightBookingInstance.id)
		}
    }

    def update() {
        def passengerInstance = Passenger.get(params.id)
        if (!passengerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (passengerInstance.version > version) {
                passengerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'passenger.label', default: 'Passenger')] as Object[],
                          "Another user has updated this Passenger while you were editing")
                render(view: "edit", model: [passengerInstance: passengerInstance])
                return
            }
        }

        passengerInstance.properties = params

        if (!passengerInstance.save(flush: true)) {
            render(view: "edit", model: [passengerInstance: passengerInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'passenger.label', default: 'Passenger'), passengerInstance.id])
        redirect(action: "show", id: passengerInstance.id)
    }

    def delete() {
        def passengerInstance = Passenger.get(params.id)
        if (!passengerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "list")
            return
        }

        try {
            passengerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'passenger.label', default: 'Passenger'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

	
	def flightSummary = {
		def db = new Sql(dataSource)
		def query1, query2, query3
		
		query1 = db.rows("SELECT flight_booking.id as id, passenger_type, gender, email, mobile_no, given_name, surname, suffix FROM passenger INNER JOIN flight_booking ON passenger.flight_booking_id = flight_booking.id WHERE passenger.id = cast(${params.id} as bigint)")
		
		query2 = db.rows("SELECT route_id, flight_number, departure_time, arrival_time, booking_code, date(departure_date) as departureDate, payment_status, payment_amount FROM flight_booking INNER JOIN flight ON flight_booking.flight_id = flight.id INNER JOIN flight_booking_payment ON flight_booking.flight_booking_payment_id = flight_booking_payment.id WHERE flight_booking.id = ${query1[0].id}")
		
		query3 = db.rows("SELECT origin, destination FROM route WHERE route.id = ${query2[0].route_id}")
        render(view: "flightSummaryView", model: [result1: query1, result2: query2, result3: query3])
	}
	
	def flightSummaryView = {}
	
	def cancel = {
		def db = new Sql(dataSource)
		db.execute("DELETE from flight_booking where id = '${params.id}'")
		render(view: "/index")
	}
}

