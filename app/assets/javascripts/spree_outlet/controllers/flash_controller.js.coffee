App.FlashController = Ember.ObjectController.extend(
  model: null
  alertClass: Ember.computed ->
    "alert-#{@get('model.type')}"
  .property('model.type')
  flashHistory: []
  flashObserver: (->
    controller = @
    alert = @get('model')
    if alert
      Ember.run.later (->
        controller.clear()
      ), 5000
  ).observes('model')
  clear: ->
    alert = @get('model')
    if alert
      @get('flashHistory').pushObject(alert)
      @set('model', null)
)