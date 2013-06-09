attr = Ember.attr

App.Taxon = Ember.Model.extend(
	id: attr()
	name: attr()
	permalink: attr()
	position: attr()
	parent_id: attr()
	taxonomy_id: attr()
)