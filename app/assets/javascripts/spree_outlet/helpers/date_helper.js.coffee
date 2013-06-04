Ember.Handlebars.registerBoundHelper('date', (dateString) ->
  if dateString && Ember.typeOf(dateString) == 'string'
    date = new Date(dateString.toString())
    date.toLocaleDateString()
)