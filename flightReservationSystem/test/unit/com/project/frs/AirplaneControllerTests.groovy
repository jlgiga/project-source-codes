package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(AirplaneController)
@Mock(Airplane)
class AirplaneControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/airplane/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.airplaneInstanceList.size() == 0
        assert model.airplaneInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.airplaneInstance != null
    }

    void testSave() {
        controller.save()

        assert model.airplaneInstance != null
        assert view == '/airplane/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/airplane/show/1'
        assert controller.flash.message != null
        assert Airplane.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/airplane/list'


        populateValidParams(params)
        def airplane = new Airplane(params)

        assert airplane.save() != null

        params.id = airplane.id

        def model = controller.show()

        assert model.airplaneInstance == airplane
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/airplane/list'


        populateValidParams(params)
        def airplane = new Airplane(params)

        assert airplane.save() != null

        params.id = airplane.id

        def model = controller.edit()

        assert model.airplaneInstance == airplane
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/airplane/list'

        response.reset()


        populateValidParams(params)
        def airplane = new Airplane(params)

        assert airplane.save() != null

        // test invalid parameters in update
        params.id = airplane.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/airplane/edit"
        assert model.airplaneInstance != null

        airplane.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/airplane/show/$airplane.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        airplane.clearErrors()

        populateValidParams(params)
        params.id = airplane.id
        params.version = -1
        controller.update()

        assert view == "/airplane/edit"
        assert model.airplaneInstance != null
        assert model.airplaneInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/airplane/list'

        response.reset()

        populateValidParams(params)
        def airplane = new Airplane(params)

        assert airplane.save() != null
        assert Airplane.count() == 1

        params.id = airplane.id

        controller.delete()

        assert Airplane.count() == 0
        assert Airplane.get(airplane.id) == null
        assert response.redirectedUrl == '/airplane/list'
    }
}
