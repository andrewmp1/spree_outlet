App.OrderRoute = Ember.Route.extend(
  model: (params) ->
    App.Order.find(params.number)

  serialize: (model) ->
    number: model.get('number')
)