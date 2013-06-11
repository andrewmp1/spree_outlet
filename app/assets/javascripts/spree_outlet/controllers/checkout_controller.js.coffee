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

  isConfirm: Ember.computed ->
    if @get('order.state') == 'confirm'
      true
    else
      false
  .property('order.state')

  address: (shipAddress, billAddress) ->
    controller = @
    if !billAddress
      billAddress = shipAddress
    data = 
      order:
        bill_address_attributes: billAddress
        ship_address_attributes: shipAddress

    @sendData("#{@get('baseURL')}", data, "PUT")
    .then((data) ->
      controller.set('order.state', data.state)
      controller.set('shipments', Ember.ObjectProxy.create(content: data.shipments))
      controller.send('next', data.state)
    )

  delivery: (shipmentId, shippingRateId) ->
    controller = @
    data =
      order:
        shipments_attributes: [
          id: shipmentId #id of shipment
          selected_shipping_rate_id: shippingRateId
        ]

    @sendData(@get('baseURL'), data, "PUT")
    .then( (data) ->
      controller.set('order.state', data.state)
      controller.set('payments', Ember.ObjectProxy.create(content: data.payments))
      controller.send('next', data.state)
    )

  payment: (payment, paymentMethodId) ->
    controller = @
    data =
      order:
        payments_attributes: [
          payment_method_id: paymentMethodId
        ]

    @sendData(@get('baseURL'), data, "PUT")
    .then( (data) ->
      controller.set('order.state', data.state)
      controller.send('next', data.state)
    )

  confirm: ->
    controller = @
    @sendData("#{@get('baseURL')}", null, "PUT")
    .then( (data) ->
      controller.send('next', data.state)
    )

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