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
  # FIXME: user & current_order dumped into DOM.
  user = window.user || undefined
  Spree = window.Spree || {}
  order = window.order || undefined
  if user
    App.set('currentUser', Ember.Object.create(user) )
  if Spree.api_key
    App.set('token', Spree.api_key)
  if order
    App.__container__.lookup('controller:cart').set('model', App.Order.create(order))