attr = Ember.attr
App.OptionType = Ember.Model.extend(
	id: attr()
	name: attr()
	position: attr()
	presentation: attr()
	option_values: Ember.computed ->
    data = @get('data.option_values')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.OptionType.create(item)
      )
  .property('data.option_values')
)