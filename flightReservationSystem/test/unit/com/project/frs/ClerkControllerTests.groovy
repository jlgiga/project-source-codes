package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(ClerkController)
@Mock(Clerk)
class ClerkControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clerk/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clerkInstanceList.size() == 0
        assert model.clerkInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.clerkInstance != null
    }

    void testSave() {
        controller.save()

        assert model.clerkInstance != null
        assert view == '/clerk/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clerk/show/1'
        assert controller.flash.message != null
        assert Clerk.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clerk/list'


        populateValidParams(params)
        def clerk = new Clerk(params)

        assert clerk.save() != null

        params.id = clerk.id

        def model = controller.show()

        assert model.clerkInstance == clerk
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clerk/list'


        populateValidParams(params)
        def clerk = new Clerk(params)

        assert clerk.save() != null

        params.id = clerk.id

        def model = controller.edit()

        assert model.clerkInstance == clerk
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clerk/list'

        response.reset()


        populateValidParams(params)
        def clerk = new Clerk(params)

        assert clerk.save() != null

        // test invalid parameters in update
        params.id = clerk.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clerk/edit"
        assert model.clerkInstance != null

        clerk.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clerk/show/$clerk.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clerk.clearErrors()

        populateValidParams(params)
        params.id = clerk.id
        params.version = -1
        controller.update()

        assert view == "/clerk/edit"
        assert model.clerkInstance != null
        assert model.clerkInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clerk/list'

        response.reset()

        populateValidParams(params)
        def clerk = new Clerk(params)

        assert clerk.save() != null
        assert Clerk.count() == 1

        params.id = clerk.id

        controller.delete()

        assert Clerk.count() == 0
        assert Clerk.get(clerk.id) == null
        assert response.redirectedUrl == '/clerk/list'
    }
}
