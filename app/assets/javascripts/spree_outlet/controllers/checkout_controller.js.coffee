App.CheckoutController = Ember.Controller.extend(
  needs: ['cart']
  orderBinding: 'controllers.cart.model'
  steps: ['checkout.address', 'checkout.delivery', 'checkout.payment', 'checkout.confirm']
  data: null
  error: null # String response for errors. Use for flash message
  errors: null # array of error messages, validations, etc.
  baseURL: Ember.computed ->
    "/api/checkouts/#{@get('order.number')}"
  .property('order.number')

  addItem: (variantId, quantity) ->
    order = @get('model')
    if order.get('isNew')
      # Create w/ line item.
    else
      url = "/api/orders/#{@get('order.number')}/line_items?line_item[variant_id]=#{variantId}&line_item[quantity]=#{quantity}"
      @sendData(url, null, "POST")

  address: (billAddress, shipAddress) ->
    data = bill_address_attributes: billAddress, ship_address_attributes: shipAddress
    @sendData("#{@get('baseURL')}", data, "PUT")

  delivery: (shipmentId, shippingRateId) ->
    url = "#{@get('baseURL')}order[shipments_attributes][0]
[selected_shipping_rate_id]=1&order[shipments_attributes][0][id]=1"
    @sendData(url, null, "PUT")


  payment: (payment, paymentMethodId) ->
    url = "#{@get('baseURL')}order[payments_attributes][][payment_method_id]=#{paymentMethodId}"
    @sendData(url, null, "PUT")

  confirm: ->
    @sendData("#{@get('baseURL')}", null, "PUT")

  update: ->
    order = @get('order')
    state = order.get('state')
    console.log("CALLING UPDATE " + state)
    if state == 'address'
      @address(order.get('shipAddress'), order.get('billAddress'))

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