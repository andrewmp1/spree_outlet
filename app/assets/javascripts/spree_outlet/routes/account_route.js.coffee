App.AccountRoute = Ember.Route.extend(
  model: ->
    App.get('currentUser')

  redirect: ->
    if !@modelFor('account')
      @transitionTo('products')

  setupController: (controller, model) ->
    controller.setProperties(
      model: model
      orders: App.Order.find(user_id: model.get('user_id'))
    )
)