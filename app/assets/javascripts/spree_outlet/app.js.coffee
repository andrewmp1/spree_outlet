###
Set up Application
###

exports = this


exports.App = Em.Application.create(
  # Logs router transitions
  LOG_TRANSITIONS: true
  # Logs when ember creates classes for you(route,controller)
  LOG_ACTIVE_GENERATION: true
)

App.ready = ->
  PRELOAD = (window.PRELOAD || {})
  if PRELOAD.user
    App.set('currentUser', Ember.Object.create(PRELOAD.user) )
  if PRELOAD.api_key
    App.set('token', PRELOAD.api_key)
  if PRELOAD.cart
    App.__container__.lookup('controller:cart').set('model', App.Order.create(PRELOAD.cart))