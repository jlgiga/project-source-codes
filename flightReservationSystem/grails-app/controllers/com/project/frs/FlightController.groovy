package com.project.frs

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.lang.RandomStringUtils
import grails.plugins.springsecurity.Secured
import groovy.sql.Sql

class FlightController {
	
	def dataSource
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [flightInstanceList: Flight.list(params), flightInstanceTotal: Flight.count()]
    }

    def create() {
        [flightInstance: new Flight(params)]
    }

    def save() {
		def db = new Sql(dataSource)
		def flightInstance = new Flight(params)
		String charset = (('A'..'Z') + ('0'..'9')).join()
		int length = 5
		String flightNumber = RandomStringUtils.random(length, charset.toCharArray())
		
		flightInstance.flightNumber = flightNumber
		
		def noOfSeats = db.rows("SELECT no_of_seats from airplane where id='${params.airplane.id}'")
		flightInstance.availableSeats = noOfSeats[0].no_of_seats
		
        if (!flightInstance.save(flush: true)) {
            render(view: "create", model: [flightInstance: flightInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def show() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def edit() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def update() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (flightInstance.version > version) {
                flightInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flight.label', default: 'Flight')] as Object[],
                          "Another user has updated this Flight while you were editing")
                render(view: "edit", model: [flightInstance: flightInstance])
                return
            }
        }

        flightInstance.properties = params

        if (!flightInstance.save(flush: true)) {
            render(view: "edit", model: [flightInstance: flightInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def delete() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        try {
            flightInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def searchFlight = {
		def db = new Sql(dataSource)
		def querySearch, queryTravelClass
		def flightOrigin = params.origin, flightDestination = params.destination
		def departureDate = params.departureDate
		
		if(departureDate == null){
			render(view: "searchFlights")
            return
		}
		
		querySearch = db.rows("SELECT flight.id as id, departure_time, arrival_time, flight_number, date(departure_date) as departureDate, airplane_type, available_seats, amount FROM flight INNER JOIN airplane ON flight.airplane_id = airplane.id INNER JOIN route ON flight.route_id = route.id WHERE origin = ${params.origin} AND destination = ${params.destination} AND cast(date(departure_date) as varchar) = '${departureDate}' AND available_seats > '0'")
		
		queryTravelClass = db.rows("SELECT id, travel_class_description as description, travel_class_amount as amount FROM travel_class")
		
		render(view:"flightList", model: [flightResult: querySearch, travelClassInstance: queryTravelClass, origin: flightOrigin, destination: flightDestination, departureDate: departureDate])
	}

	def searchFlights = {}
	
	def flightList = {}
	
	def aboutFRS = {}
	
	def aboutFlights = {}
	
	def contact = {}
}
