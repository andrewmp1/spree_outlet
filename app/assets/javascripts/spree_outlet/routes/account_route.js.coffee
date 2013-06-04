App.AccountRoute = Ember.Route.extend(
  model: ->
    App.get('currentUser')

  setupController: (controller, model) ->
    @._super(controller, model)
    controller.set('orders', App.Order.find(user_id: model.get('user_id')))
)