App.ProductController = Ember.ObjectController.extend(
  needs: ['cart']
  quantity: 1
  variant: Ember.computed ->
    @get('model.masterVariant')
  .property('model')
  addToCart: ->
    console.log("ADDING TO CART")
    @get('controllers.cart').addItem(@get('variant.id'), @get('quantity') )
)