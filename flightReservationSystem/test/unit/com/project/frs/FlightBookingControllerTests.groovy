package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(FlightBookingController)
@Mock(FlightBooking)
class FlightBookingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/flightBooking/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.flightBookingInstanceList.size() == 0
        assert model.flightBookingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.flightBookingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.flightBookingInstance != null
        assert view == '/flightBooking/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/flightBooking/show/1'
        assert controller.flash.message != null
        assert FlightBooking.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBooking/list'


        populateValidParams(params)
        def flightBooking = new FlightBooking(params)

        assert flightBooking.save() != null

        params.id = flightBooking.id

        def model = controller.show()

        assert model.flightBookingInstance == flightBooking
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBooking/list'


        populateValidParams(params)
        def flightBooking = new FlightBooking(params)

        assert flightBooking.save() != null

        params.id = flightBooking.id

        def model = controller.edit()

        assert model.flightBookingInstance == flightBooking
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBooking/list'

        response.reset()


        populateValidParams(params)
        def flightBooking = new FlightBooking(params)

        assert flightBooking.save() != null

        // test invalid parameters in update
        params.id = flightBooking.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/flightBooking/edit"
        assert model.flightBookingInstance != null

        flightBooking.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/flightBooking/show/$flightBooking.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        flightBooking.clearErrors()

        populateValidParams(params)
        params.id = flightBooking.id
        params.version = -1
        controller.update()

        assert view == "/flightBooking/edit"
        assert model.flightBookingInstance != null
        assert model.flightBookingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/flightBooking/list'

        response.reset()

        populateValidParams(params)
        def flightBooking = new FlightBooking(params)

        assert flightBooking.save() != null
        assert FlightBooking.count() == 1

        params.id = flightBooking.id

        controller.delete()

        assert FlightBooking.count() == 0
        assert FlightBooking.get(flightBooking.id) == null
        assert response.redirectedUrl == '/flightBooking/list'
    }
}
