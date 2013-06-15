App.ProductController = Ember.ObjectController.extend(
  needs: ['cart']
  quantity: 1
  variantId: null
  addToCart: ->
    controller = @
    variantId = @get('variantId') || @get('model.master.id')
    promise = @get('controllers.cart').addItem(variantId, @get('quantity') )
    promise.then( ->
      alert = App.Alert.create(type: "success", message: "Added item to cart: #{controller.get('model.name')}")
      controller.send('flash', alert)
    , ->
      alert = App.Alert.create(type: "error", message: 'Woops an error occured')
      controller.send('flash', alert)
    )

  clearFields: ->
  	@setProperties(
  		quantity: 1
  		variant: null
  	)
)