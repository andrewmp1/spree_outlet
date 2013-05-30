App.ProductsIndexRoute = Ember.Route.extend(
  model: ->
    App.Product.find()
)