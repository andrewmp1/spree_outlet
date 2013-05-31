App.CartController = Ember.ObjectController.extend(
  model: null
  addItem: (variantId, quantity) ->
    model = @get('model')
    if !model
      # Define a method on order class to create w/ item
      model = App.Order.createWithItem(variantId, quantity)
      @set('model', model)
    else
      model.addItem(variantId, quantity)

)