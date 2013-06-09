attr = Ember.attr

App.Address = Ember.Model.extend(
  id: attr()
  first_name: attr()
  last_name: attr()
  address1: attr()
  address2: attr()
  city: attr()
  state_id: attr()
  country_id: attr()
  phone: attr()
)

App.Address.reopenClass(
  rootKey: null
  collectionKey: "address"
  url: "/api/address"
  adapter: Ember.RESTAdapter.create()
)