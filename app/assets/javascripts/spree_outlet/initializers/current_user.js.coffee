Ember.Application.initializer(
  name: "currentUser"
  initialize: (container) ->
    PRELOAD = (window.PRELOAD || {})
    if PRELOAD.user
      App.set('currentUser', Ember.Object.create(PRELOAD.user) )
    if PRELOAD.api_key
      App.set('token', PRELOAD.api_key)
)