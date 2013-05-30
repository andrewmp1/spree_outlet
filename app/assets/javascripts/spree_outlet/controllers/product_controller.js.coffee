App.ProductController = Ember.ObjectController.extend(
  needs: ['checkout']
  quantity: 1
  addToCart: ->
    console.log("ADDING TO CART")
    @get('controllers.checkout.model').addItem(item.get('id'), quantity)
    # @get('controllers.checkout').addToCart(@get('model'), @get('quantity'))
)