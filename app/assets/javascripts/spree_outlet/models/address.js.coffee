attr = Ember.attr

App.Address = Ember.Model.extend(
  id: attr()
)

App.Address.reopenClass(
  rootKey: null
  collectionKey: "address"
  url: "/api/address"
  adapter: Ember.RESTAdapter.create()
)