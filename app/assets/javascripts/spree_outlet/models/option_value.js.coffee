attr = Ember.attr
App.OptionValue = Ember.Model.extend(
	id: attr()
	name: attr()
	presentation: attr()
	position: attr()
	option_type_id: attr()
	option_type_name: attr()
)