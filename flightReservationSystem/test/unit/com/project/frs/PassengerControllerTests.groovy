package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(PassengerController)
@Mock(Passenger)
class PassengerControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/passenger/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.passengerInstanceList.size() == 0
        assert model.passengerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.passengerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.passengerInstance != null
        assert view == '/passenger/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/passenger/show/1'
        assert controller.flash.message != null
        assert Passenger.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/passenger/list'


        populateValidParams(params)
        def passenger = new Passenger(params)

        assert passenger.save() != null

        params.id = passenger.id

        def model = controller.show()

        assert model.passengerInstance == passenger
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/passenger/list'


        populateValidParams(params)
        def passenger = new Passenger(params)

        assert passenger.save() != null

        params.id = passenger.id

        def model = controller.edit()

        assert model.passengerInstance == passenger
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/passenger/list'

        response.reset()


        populateValidParams(params)
        def passenger = new Passenger(params)

        assert passenger.save() != null

        // test invalid parameters in update
        params.id = passenger.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/passenger/edit"
        assert model.passengerInstance != null

        passenger.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/passenger/show/$passenger.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        passenger.clearErrors()

        populateValidParams(params)
        params.id = passenger.id
        params.version = -1
        controller.update()

        assert view == "/passenger/edit"
        assert model.passengerInstance != null
        assert model.passengerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/passenger/list'

        response.reset()

        populateValidParams(params)
        def passenger = new Passenger(params)

        assert passenger.save() != null
        assert Passenger.count() == 1

        params.id = passenger.id

        controller.delete()

        assert Passenger.count() == 0
        assert Passenger.get(passenger.id) == null
        assert response.redirectedUrl == '/passenger/list'
    }
}
