App.CheckoutPaymentController = Ember.Controller.extend(
  needs: ['cart']
  orderBinding: 'controllers.cart.order'
  paymentMethod: null
  cardNumber: null  #CC Number
  expiration: null #Expiration Date
  cardCode: null #CVV
  paymentMethods: Ember.computed ->
    controller = @
    records = Ember.RecordArray.create(content: [])
    App.ajax("/api/orders/#{@get('order.number')}/payments/new")
    .then( (data) ->
      if data.payment_methods
        data.payment_methods.forEach( (item) ->
          records.pushObject(App.PaymentMethod.create(item))
        )
    ).then(null, (jqXHR) ->
      controller.set('error', jqXHR.responseText)
    )
    records
  .property('order.number')
  isCreditCard: Ember.computed ->
    paymentMethodId = @get('paymentMethod')
    if !Ember.isEmpty(paymentMethodId)
      paymentMethod = @get('paymentMethods').findProperty('id', paymentMethodId)
      # FIXME. Seems like paymentMethod should include type.
      if paymentMethod && !/Check/.test(paymentMethod.get('name'))
        true
      else
        false
    else
      false
  .property("paymentMethod")
)