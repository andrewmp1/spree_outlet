App.CheckoutController = Ember.Controller.extend(
  needs: ['cart']
  modelBinding: 'controllers.cart.model'
  steps: ['registration', 'cart', 'delivery', 'payment', 'confirm']
  data: null
  error: null # String response for errors. Use for flash message
  errors: null # array of error messages, validations, etc.
  baseURL: Ember.computed ->
    "/api/checkouts/#{@get('model.number')}?"
  .property('model.number')

  addItem: (variantId, quantity) ->
    order = @get('model')
    if order.get('isNew')
      # Create w/ line item.
    else
      url = "/api/orders/#{@get('model.number')}/line_items?line_item[variant_id]=#{variantId}&line_item[quantity]=#{quantity}"
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

  confirm: () ->
    @sendData("#{@get('baseURL')}", null, "PUT")

  sendData: (url, params, type) ->
    controller = @
    promise = App.ajax(url, params, type)
    promise.then((data) ->
      controller.set('data', data)
    ).then(null,
      controller.set('error', data.error)
      controller.set('errors', data.errors)
    )
    promise
)