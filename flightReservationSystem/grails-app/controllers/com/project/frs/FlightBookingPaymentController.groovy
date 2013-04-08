package com.project.frs

import org.springframework.dao.DataIntegrityViolationException

class FlightBookingPaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [flightBookingPaymentInstanceList: FlightBookingPayment.list(params), flightBookingPaymentInstanceTotal: FlightBookingPayment.count()]
    }

    def create() {
        [flightBookingPaymentInstance: new FlightBookingPayment(params)]
    }

    def save() {
        def flightBookingPaymentInstance = new FlightBookingPayment(params)
        if (!flightBookingPaymentInstance.save(flush: true)) {
            render(view: "create", model: [flightBookingPaymentInstance: flightBookingPaymentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), flightBookingPaymentInstance.id])
        redirect(action: "show", id: flightBookingPaymentInstance.id)
    }

    def show() {
        def flightBookingPaymentInstance = FlightBookingPayment.get(params.id)
        if (!flightBookingPaymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "list")
            return
        }

        [flightBookingPaymentInstance: flightBookingPaymentInstance]
    }

    def edit() {
        def flightBookingPaymentInstance = FlightBookingPayment.get(params.id)
        if (!flightBookingPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "list")
            return
        }

        [flightBookingPaymentInstance: flightBookingPaymentInstance]
    }

    def update() {
        def flightBookingPaymentInstance = FlightBookingPayment.get(params.id)
        if (!flightBookingPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (flightBookingPaymentInstance.version > version) {
                flightBookingPaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment')] as Object[],
                          "Another user has updated this FlightBookingPayment while you were editing")
                render(view: "edit", model: [flightBookingPaymentInstance: flightBookingPaymentInstance])
                return
            }
        }

        flightBookingPaymentInstance.properties = params

        if (!flightBookingPaymentInstance.save(flush: true)) {
            render(view: "edit", model: [flightBookingPaymentInstance: flightBookingPaymentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), flightBookingPaymentInstance.id])
        redirect(action: "show", id: flightBookingPaymentInstance.id)
    }

    def delete() {
        def flightBookingPaymentInstance = FlightBookingPayment.get(params.id)
        if (!flightBookingPaymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            flightBookingPaymentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flightBookingPayment.label', default: 'FlightBookingPayment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
