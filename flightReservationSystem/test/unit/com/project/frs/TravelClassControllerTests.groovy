package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(TravelClassController)
@Mock(TravelClass)
class TravelClassControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/travelClass/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.travelClassInstanceList.size() == 0
        assert model.travelClassInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.travelClassInstance != null
    }

    void testSave() {
        controller.save()

        assert model.travelClassInstance != null
        assert view == '/travelClass/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/travelClass/show/1'
        assert controller.flash.message != null
        assert TravelClass.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/travelClass/list'


        populateValidParams(params)
        def travelClass = new TravelClass(params)

        assert travelClass.save() != null

        params.id = travelClass.id

        def model = controller.show()

        assert model.travelClassInstance == travelClass
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/travelClass/list'


        populateValidParams(params)
        def travelClass = new TravelClass(params)

        assert travelClass.save() != null

        params.id = travelClass.id

        def model = controller.edit()

        assert model.travelClassInstance == travelClass
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/travelClass/list'

        response.reset()


        populateValidParams(params)
        def travelClass = new TravelClass(params)

        assert travelClass.save() != null

        // test invalid parameters in update
        params.id = travelClass.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/travelClass/edit"
        assert model.travelClassInstance != null

        travelClass.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/travelClass/show/$travelClass.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        travelClass.clearErrors()

        populateValidParams(params)
        params.id = travelClass.id
        params.version = -1
        controller.update()

        assert view == "/travelClass/edit"
        assert model.travelClassInstance != null
        assert model.travelClassInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/travelClass/list'

        response.reset()

        populateValidParams(params)
        def travelClass = new TravelClass(params)

        assert travelClass.save() != null
        assert TravelClass.count() == 1

        params.id = travelClass.id

        controller.delete()

        assert TravelClass.count() == 0
        assert TravelClass.get(travelClass.id) == null
        assert response.redirectedUrl == '/travelClass/list'
    }
}
