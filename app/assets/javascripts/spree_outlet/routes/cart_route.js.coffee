App.CartRoute = Ember.Route.extend(
  renderTemplate: ->
    @render('cart/index'
      controller: 'cart'
    )
)