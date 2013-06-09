App.ProductController = Ember.ObjectController.extend(
  needs: ['cart']
  quantity: 1
  variantId: null
  addToCart: ->
    console.log("ADDING TO CART")
    variantId = @get('variantId') || @get('model.master.id')
    @get('controllers.cart').addItem(variantId, @get('quantity') )

  clearFields: ->
  	@setProperties(
  		quantity: 1
  		variant: null
  	)
)