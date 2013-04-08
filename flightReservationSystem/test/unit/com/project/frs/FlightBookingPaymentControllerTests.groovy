package com.project.frs



import org.junit.*
import grails.test.mixin.*

@TestFor(FlightBookingPaymentController)
@Mock(FlightBookingPayment)
class FlightBookingPaymentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/flightBookingPayment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.flightBookingPaymentInstanceList.size() == 0
        assert model.flightBookingPaymentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.flightBookingPaymentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.flightBookingPaymentInstance != null
        assert view == '/flightBookingPayment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/flightBookingPayment/show/1'
        assert controller.flash.message != null
        assert FlightBookingPayment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBookingPayment/list'


        populateValidParams(params)
        def flightBookingPayment = new FlightBookingPayment(params)

        assert flightBookingPayment.save() != null

        params.id = flightBookingPayment.id

        def model = controller.show()

        assert model.flightBookingPaymentInstance == flightBookingPayment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBookingPayment/list'


        populateValidParams(params)
        def flightBookingPayment = new FlightBookingPayment(params)

        assert flightBookingPayment.save() != null

        params.id = flightBookingPayment.id

        def model = controller.edit()

        assert model.flightBookingPaymentInstance == flightBookingPayment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/flightBookingPayment/list'

        response.reset()


        populateValidParams(params)
        def flightBookingPayment = new FlightBookingPayment(params)

        assert flightBookingPayment.save() != null

        // test invalid parameters in update
        params.id = flightBookingPayment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/flightBookingPayment/edit"
        assert model.flightBookingPaymentInstance != null

        flightBookingPayment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/flightBookingPayment/show/$flightBookingPayment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        flightBookingPayment.clearErrors()

        populateValidParams(params)
        params.id = flightBookingPayment.id
        params.version = -1
        controller.update()

        assert view == "/flightBookingPayment/edit"
        assert model.flightBookingPaymentInstance != null
        assert model.flightBookingPaymentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/flightBookingPayment/list'

        response.reset()

        populateValidParams(params)
        def flightBookingPayment = new FlightBookingPayment(params)

        assert flightBookingPayment.save() != null
        assert FlightBookingPayment.count() == 1

        params.id = flightBookingPayment.id

        controller.delete()

        assert FlightBookingPayment.count() == 0
        assert FlightBookingPayment.get(flightBookingPayment.id) == null
        assert response.redirectedUrl == '/flightBookingPayment/list'
    }
}
