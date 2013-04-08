package com.project.frs

import org.springframework.dao.DataIntegrityViolationException

class AirplaneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [airplaneInstanceList: Airplane.list(params), airplaneInstanceTotal: Airplane.count()]
    }

    def create() {
        [airplaneInstance: new Airplane(params)]
    }

    def save() {
        def airplaneInstance = new Airplane(params)
        if (!airplaneInstance.save(flush: true)) {
            render(view: "create", model: [airplaneInstance: airplaneInstance])
            return
        }

		//flash.message = message(code: 'default.created.message', args: [message(code: 'airplane.label', default: 'Airplane'), airplaneInstance.id])
        flash.message = "Airplane Created"
		redirect(action: "show", id: airplaneInstance.id)
    }

    def show() {
        def airplaneInstance = Airplane.get(params.id)
        if (!airplaneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            redirect(action: "list")
            return
        }

        [airplaneInstance: airplaneInstance]
    }

    def edit() {
        def airplaneInstance = Airplane.get(params.id)
        if (!airplaneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            redirect(action: "list")
            return
        }

        [airplaneInstance: airplaneInstance]
    }

    def update() {
        def airplaneInstance = Airplane.get(params.id)
        if (!airplaneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (airplaneInstance.version > version) {
                airplaneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'airplane.label', default: 'Airplane')] as Object[],
                          "Another user has updated this Airplane while you were editing")
                render(view: "edit", model: [airplaneInstance: airplaneInstance])
                return
            }
        }

        airplaneInstance.properties = params

        if (!airplaneInstance.save(flush: true)) {
            render(view: "edit", model: [airplaneInstance: airplaneInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'airplane.label', default: 'Airplane'), airplaneInstance.id])
        redirect(action: "show", id: airplaneInstance.id)
    }

    def delete() {
        def airplaneInstance = Airplane.get(params.id)
        if (!airplaneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            redirect(action: "list")
            return
        }

        try {
            airplaneInstance.delete(flush: true)
			//flash.message = message(code: 'default.deleted.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            flash.message = "Airplane deleted."
			redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'airplane.label', default: 'Airplane'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
