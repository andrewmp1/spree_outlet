App.CheckoutRoute = Ember.Route.extend(
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