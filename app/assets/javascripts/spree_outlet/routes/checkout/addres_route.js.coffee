App.CheckoutAddressRoute = Ember.Route.extend(
  events:
    update: ->
      checkout = @controllerFor('checkout')
      router = @
      promise = checkout.address(checkout.get('order.billAddress'), checkout.get('order.shipAddress'))
      promise.then( (data) ->
        router.transitionTo("checkout.#{data.state}")
      )

  setupController: (controller) ->
    model = @controllerFor('cart').get('model')
    if !model
      @transitionTo('cart')
    else
      controller.set('model', model)

)