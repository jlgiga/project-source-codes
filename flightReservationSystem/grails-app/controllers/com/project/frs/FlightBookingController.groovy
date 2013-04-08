package com.project.frs

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.lang.RandomStringUtils
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.*
import groovy.sql.Sql

class FlightBookingController {
	SpringSecurityService springSecurityService
	def dataSource
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [flightBookingInstanceList: FlightBooking.list(params), flightBookingInstanceTotal: FlightBooking.count()]
    }

    def create() {
        [flightBookingInstance: new FlightBooking(params)]
    }

    def save() {
        def db = new Sql(dataSource)
		def flightBookingInstance = new FlightBooking(params)
		def flightBookingPaymentInstance = new FlightBookingPayment(params)
		def routeAmount, travelClassAmount, flightAmount
		def available
		def travelClassId = params.travelClass.id
		def flightID = params.flight.id
		
		String charset = (('A'..'Z') + ('0'..'9')).join()
		int length = 4
		String bookingCode = RandomStringUtils.random(length, charset.toCharArray())
		
		flightBookingInstance.bookingCode = bookingCode
		flightBookingInstance.paymentStatus = "RESERVED"
		flightBookingInstance.save()
		flightBookingPaymentInstance.flightBooking = FlightBooking.get(flightBookingInstance.id)
		travelClassAmount = db.rows("SELECT travel_class_amount FROM travel_class where id='${params.travelClass.id}'")
		routeAmount = db.rows("SELECT amount FROM flight INNER JOIN route ON flight.route_id = route.id where flight.id='${params.flight.id}'")
		flightAmount = routeAmount[0].amount + travelClassAmount[0].travel_class_amount
		flightBookingPaymentInstance.paymentAmount = flightAmount
		flightBookingPaymentInstance.save()
		flightBookingInstance.flightBookingPayment = FlightBookingPayment.get(flightBookingPaymentInstance.id)
		db.execute("UPDATE flight set available_seats = (available_seats - 1) where id = '${params.flight.id}'")
		
        if (!flightBookingInstance.save(flush: true)) {
            render(view: "create", model: [flightBookingInstance: flightBookingInstance])
            return
        }
		
		def userlogged = springSecurityService.getCurrentUser()
		
		if(userlogged != null) {
			flightBookingInstance.customer = User.get(springSecurityService.principal.id)
			flightBookingInstance.save()
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), flightBookingInstance.id])
		redirect(controller: "passenger", action: "passengerInfo", id: flightBookingInstance.id)
    }

    def show() {
        def flightBookingInstance = FlightBooking.get(params.id)
        if (!flightBookingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "list")
            return
        }

        [flightBookingInstance: flightBookingInstance]
    }

    def edit() {
        def flightBookingInstance = FlightBooking.get(params.id)
        if (!flightBookingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "list")
            return
        }

        [flightBookingInstance: flightBookingInstance]
    }

    def update() {
        def flightBookingInstance = FlightBooking.get(params.id)
        if (!flightBookingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (flightBookingInstance.version > version) {
                flightBookingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flightBooking.label', default: 'FlightBooking')] as Object[],
                          "Another user has updated this FlightBooking while you were editing")
                render(view: "edit", model: [flightBookingInstance: flightBookingInstance])
                return
            }
        }

        flightBookingInstance.properties = params

        if (!flightBookingInstance.save(flush: true)) {
            render(view: "edit", model: [flightBookingInstance: flightBookingInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), flightBookingInstance.id])
        redirect(action: "show", id: flightBookingInstance.id)
    }

    def delete() {
        def flightBookingInstance = FlightBooking.get(params.id)
        if (!flightBookingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "list")
            return
        }

        try {
            flightBookingInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flightBooking.label', default: 'FlightBooking'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def searchCode() {
		def db = new Sql(dataSource)
		def querySearch
		Date dateNow = new Date()
		int day = dateNow.date
		int expire = day - 2
		
		db.execute("DELETE from flight_booking where date_part('day', last_updated) <= '${expire}' and payment_status='RESERVED'")
		
		querySearch = db.rows("SELECT id, booking_code, payment_status from flight_booking where booking_code ='${params.bookingCode}' AND date_part('day', last_updated) <= '${day}' and payment_status='RESERVED'") 
		
		render(view:"reservedFlights", model:[querySearch:querySearch])
	}
	
	def searchBookingCode = {}
	
	def confirmStatus() {
		def db = new Sql(dataSource)
		def query1, query2, query3
		
		db.execute("UPDATE flight_booking SET payment_status='CONFIRMED' WHERE id = cast(${params.bookingId} as bigint)")
		
		query1 = db.rows("SELECT passenger.id as passengerID, passenger_type, gender, email, mobile_no, given_name, surname, suffix FROM passenger INNER JOIN flight_booking ON passenger.flight_booking_id = flight_booking.id WHERE passenger.flight_booking_id = cast(${params.bookingId} as bigint)")
		
		query2 = db.rows("SELECT flight_booking.id as flightBookingId, flight.id as flightId, flight_booking_payment.id as flightBookingPaymentId,route_id, flight_number, booking_code, departure_time, arrival_time, flight_number, date(departure_date) as departureDate, payment_status, payment_amount FROM flight_booking INNER JOIN flight ON flight_booking.flight_id = flight.id INNER JOIN flight_booking_payment ON flight_booking.flight_booking_payment_id = flight_booking_payment.id WHERE flight_booking.id = cast(${params.bookingId} as bigint)")
		
		query3 = db.rows("SELECT origin, destination FROM route WHERE route.id = ${query2[0].route_id}")
		
		render(view: "confirmedFlight", model: [result1: query1, result2: query2, result3: query3])
	}
	
	def confirmedFlight = {}
	
	def print = {	
		def db = new Sql(dataSource)
		def passengerInstance = Passenger.get(params.passenger.id)
		def flightBookingInstance = FlightBooking.get(params.flightBooking.id)
		def flightInstance = Flight.get(params.flight.id)
		def query = db.rows("SELECT route_id FROM flight WHERE flight.id = cast(${params.flight.id} as bigint)")
		def routeInstance = Route.get(query[0].route_id)
		def flightBookingPaymentInstance = FlightBookingPayment.get(params.flightBookingPayment.id)
		render(view: "receipt", model: [passengerInstance: passengerInstance, flightBookingInstance: flightBookingInstance, flightInstance: flightInstance, flightBookingPaymentInstance: flightBookingPaymentInstance, routeInstance: routeInstance])
	}
	
	def receipt = {}
}
