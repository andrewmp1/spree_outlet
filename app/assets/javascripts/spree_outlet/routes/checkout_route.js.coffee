App.CheckoutRoute = Ember.Route.extend(
  events:
    update: ->
      controller = @controllerFor('checkout')
      order = controller.get('order')
      state = order.get('state')
      if state == 'address'
        controller.address()
      if state == 'delivery'
        controller.delivery(3, 7)
      if state == 'payment'
        paymentController = @controllerFor('checkoutPayment')
        paymentController.payment(1,1)
      if state == 'confirm'
        controller.confirm()
    next: (state) ->
      # Should also check for complete
      state = state || @controllerFor('cart').get('order.state')
      @transitionTo("checkout.#{state}")

  # Not ready to checkout
  redirect: ->
    order = @controllerFor('cart').get('model')
    console.log(order.get('checkoutAllowed'))
    if !order or !order.get('checkoutAllowed')
      console.log("REDIRECTING TO CART")
      @transitionTo('cart')
    else
      state = order.get('state') || 'address'
      @transitionTo("checkout.#{state}")
)