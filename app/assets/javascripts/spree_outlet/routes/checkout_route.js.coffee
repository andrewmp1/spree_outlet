App.CheckoutRoute = Ember.Route.extend(
  events:
    update: ->
      checkout = @controllerFor('checkout')
      order = checkout.get('order')
      state = order.get('state')
      if state == 'address'
        checkout.address()
      if state == 'delivery'
        checkout.delivery(3, 7)
      if state == 'payment'
        payment = @controllerFor('checkoutPayment')
        paymentMethodId = payment.get('paymentMethod')
        checkout.payment(paymentMethodId,1)
      if state == 'confirm'
        checkout.confirm()

    next: (state) ->
      # Should also check for complete
      state = state || @controllerFor('cart').get('order.state')
      @transitionTo("checkout.#{state}")

  # Not ready to checkout
  redirect: ->
    order = @controllerFor('cart').get('model')

    if !order or !order.get('checkoutAllowed')
      console.log("REDIRECTING TO CART")
      @transitionTo('cart')
    else
      state = order.get('state') || 'address'
      @transitionTo("checkout.#{state}")
)