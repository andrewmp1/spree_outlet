attr = Ember.attr

App.Zone = Ember.Model.extend(
  id: attr()
)

App.Zone.reopenClass(
  url: "/api/zones"
  rootKey: null
  collectionKey: "zones"
  adapter: Ember.RESTAdapter.create()
)