App.CheckoutRoute = Ember.Route.extend(
  # Not ready to checkout
  redirect: ->
    order = @controllerFor('cart').get('model')
    if !order or !order.get('state') or !order.get('checkoutAllowed')
      console.log("REDIRECTING TO CART")
      @transitionTo('cart')
    else
      @transitionTo("checkout.#{order.get('state')}")
)