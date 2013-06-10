App.CheckoutController = Ember.Controller.extend(
  needs: ['cart']
  orderBinding: 'controllers.cart.model'
  steps: ['checkout.address', 'checkout.delivery', 'checkout.payment', 'checkout.confirm']
  data: null
  shipments: null
  error: null # String response for errors. Use for flash message
  errors: null # array of error messages, validations, etc.
  baseURL: Ember.computed ->
    "/api/checkouts/#{@get('order.number')}"
  .property('order.number')

  next: ->
    @send("checkout.#{@get('data.state')}")

  address: (shipAddress, billAddress) ->
    if !billAddress
      billAddress = shipAddress
    data = 
      order:
        bill_address_attributes: billAddress
        ship_address_attributes: shipAddress
    @sendData("#{@get('baseURL')}", data, "PUT")
    .then((data) ->
      controller.set('shipments', Ember.ObjectProxy.create(content: data.shipments))
    )

  delivery: (shipmentId, shippingRateId) ->
    data =
      order:
        shipments_attributes: [
          id: shipmentId #id of shipment
          selected_shipping_rate_id: shippingRateId
        ]
    @sendData(url, data, "PUT")


  payment: (payment, paymentMethodId) ->
    data =
      order:
        payments_attributes: [
          payment_method_id: paymentMethodId
        ]
    @sendData(url, null, "PUT")

  confirm: ->
    @sendData("#{@get('baseURL')}", null, "PUT")

  update: ->
    order = @get('order')
    state = order.get('state')
    console.log("CALLING UPDATE " + state)
    if state == 'address'
      @address(order.get('shipAddress'), order.get('billAddress'))
    if state == 'delivery'
      @delivery(3, 7)
    if state == 'payment'
      @payment(1,1)
    if state == 'confirm'
      @confirm()

  sendData: (url, params, type) ->
    controller = @
    promise = App.ajax(url, params, type)
    promise.then((data) ->
      controller.set('data', data)
    ).then(null, (jqXHR) ->
      controller.set('error', jqXHR.responseText)
    )
    promise
)