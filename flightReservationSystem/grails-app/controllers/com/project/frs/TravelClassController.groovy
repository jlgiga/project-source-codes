package com.project.frs

import org.springframework.dao.DataIntegrityViolationException

class TravelClassController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [travelClassInstanceList: TravelClass.list(params), travelClassInstanceTotal: TravelClass.count()]
    }

    def create() {
        [travelClassInstance: new TravelClass(params)]
    }

    def save() {
        def travelClassInstance = new TravelClass(params)
        if (!travelClassInstance.save(flush: true)) {
            render(view: "create", model: [travelClassInstance: travelClassInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), travelClassInstance.id])
        redirect(action: "show", id: travelClassInstance.id)
    }

    def show() {
        def travelClassInstance = TravelClass.get(params.id)
        if (!travelClassInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "list")
            return
        }

        [travelClassInstance: travelClassInstance]
    }

    def edit() {
        def travelClassInstance = TravelClass.get(params.id)
        if (!travelClassInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "list")
            return
        }

        [travelClassInstance: travelClassInstance]
    }

    def update() {
        def travelClassInstance = TravelClass.get(params.id)
        if (!travelClassInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (travelClassInstance.version > version) {
                travelClassInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'travelClass.label', default: 'TravelClass')] as Object[],
                          "Another user has updated this TravelClass while you were editing")
                render(view: "edit", model: [travelClassInstance: travelClassInstance])
                return
            }
        }

        travelClassInstance.properties = params

        if (!travelClassInstance.save(flush: true)) {
            render(view: "edit", model: [travelClassInstance: travelClassInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), travelClassInstance.id])
        redirect(action: "show", id: travelClassInstance.id)
    }

    def delete() {
        def travelClassInstance = TravelClass.get(params.id)
        if (!travelClassInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "list")
            return
        }

        try {
            travelClassInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'travelClass.label', default: 'TravelClass'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
