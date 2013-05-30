attr = Ember.attr

App.Taxonomy = Ember.Model.extend(
  id: attr()
  name: attr()
  root: attr()
)

App.Taxonomy.reopenClass(
  url: "/api/taxonomies"
  rootKey: "taxonomy"
  collectionKey: "taxonomies"
  adapter: Ember.RESTAdapter.create()
)