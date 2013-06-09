App.ProductRoute = Ember.Route.extend(
  model: (params) ->
    App.Product.find(params.permalink)

  serialize: (model) ->
    permalink: model.get('permalink')

  deactivate: ->
  	@controllerFor('product').clearFields()
)