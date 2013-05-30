attr = Ember.attr

App.Address = Ember.Model.extend(
  id: attr()
)

App.Address.reopenClass(
  rootKey: "address"
  collectionKey: "address"
  url: "/api/address"
  adapter: Ember.RESTAdapter.create()
)