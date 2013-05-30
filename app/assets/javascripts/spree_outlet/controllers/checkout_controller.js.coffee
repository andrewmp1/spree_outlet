App.CheckoutController = Ember.ObjectController.extend(
  model: App.Order.create()
  steps: ['cart', 'delivery', 'payment', 'confirm']
  data: null
  baseURL: Ember.computed ->
    "/api/checkouts/#{@get('content.number')}?"
  .property('content.number')

  addItem: (variantId, quantity) ->
    order = @get('model')
    if order.get('isNew')
      # Create w/ line item.
    else
      url = "/api/orders/#{@get('content.number')}/line_items?line_item[variant_id]=#{variantId}&line_item[quantity]=#{quantity}"
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
    )
    promise
)

window.checkoutTest = ->
  App.set('token', Spree.api_key)
  controller = App.__container__.lookup('controller:checkout')
  order = App.Order.create()
  order.save()
  controller.set('content', order)
  controller