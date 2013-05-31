App.ApplicationController = Ember.Controller.extend(
  needs: 'cart'
  cartBinding: 'controllers.cart'
)