Ember.Route.reopen(
  events:
    flash: (flash) ->
      @controllerFor('flash').set('model', flash)
    clearFlash: ->
      @controllerFor('flash').clear()

	deactivate: ->
    @_super()
    @controllerFor('flash').clear()
)