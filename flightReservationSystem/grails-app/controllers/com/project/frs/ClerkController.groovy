package com.project.frs

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.*
import groovy.sql.Sql

class ClerkController {
	SpringSecurityService springSecurityService
	def dataSource
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clerkInstanceList: Clerk.list(params), clerkInstanceTotal: Clerk.count()]
    }

    def create() {
        [clerkInstance: new Clerk(params)]
    }

    def save() {
		def db = new Sql(dataSource)
        def clerkInstance = new Clerk(params)
		def role = db.rows("SELECT id FROM role WHERE authority = 'ROLE_CASHIER'")
		def userRoleInstance = new UserRole()
		
		
        if (!clerkInstance.save(flush: true)) {
            render(view: "create", model: [clerkInstance: clerkInstance])
            return
        }
		
		userRoleInstance.user = User.get(clerkInstance.id)
		userRoleInstance.role = Role.get(role[0].id)
		userRoleInstance.save()
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'clerk.label', default: 'Clerk'), clerkInstance.id])
        //redirect(action: "show", id: clerkInstance.id)
		redirect(view: "list")
    }

    def show() {
        def clerkInstance = Clerk.get(params.id)
        if (!clerkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "list")
            return
        }

        [clerkInstance: clerkInstance]
    }

    def edit() {
        def clerkInstance = Clerk.get(params.id)
        if (!clerkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "list")
            return
        }

        [clerkInstance: clerkInstance]
    }

    def update() {
        def clerkInstance = Clerk.get(params.id)
        if (!clerkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (clerkInstance.version > version) {
                clerkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'clerk.label', default: 'Clerk')] as Object[],
                          "Another user has updated this Clerk while you were editing")
                render(view: "edit", model: [clerkInstance: clerkInstance])
                return
            }
        }

        clerkInstance.properties = params

        if (!clerkInstance.save(flush: true)) {
            render(view: "edit", model: [clerkInstance: clerkInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'clerk.label', default: 'Clerk'), clerkInstance.id])
        redirect(action: "show", id: clerkInstance.id)
    }

    def delete() {
        def clerkInstance = Clerk.get(params.id)
        if (!clerkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "list")
            return
        }

        try {
            clerkInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clerk.label', default: 'Clerk'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def adminManage = {}
	
	def account = {
		 redirect(action: "show", id: springSecurityService.principal.id)
	}
}
