App.ProductsIndexRoute = Ember.Route.extend(
  model: ->
    App.Product.find()

  setupController: (controller, model) ->
    @._super(controller, model)
    controller.set('taxons', App.Taxonomy.find())
)