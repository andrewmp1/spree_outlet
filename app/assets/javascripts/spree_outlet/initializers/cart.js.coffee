Ember.Application.initializer(
  name: "cart"
  initialize: (container) ->
    PRELOAD = (window.PRELOAD || {})
    if PRELOAD.cart
      order = App.Order.create()
      order.load(PRELOAD.cart.number, PRELOAD.cart)
      container.lookup('controller:cart').set('model', order)
)