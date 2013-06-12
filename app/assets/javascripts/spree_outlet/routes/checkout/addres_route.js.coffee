App.CheckoutAddressRoute = Ember.Route.extend(
  setupController: (controller) ->
    model = @controllerFor('cart').get('model')
    if !model
      @transitionTo('cart')
    else
      controller.set('model', model)

)