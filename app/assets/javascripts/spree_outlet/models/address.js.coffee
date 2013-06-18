attr = Ember.attr

App.Address = Ember.Model.extend(
  id: attr()
  firstname: attr()
  lastname: attr()
  address1: attr()
  address2: attr()
  city: attr()
  state_id: attr()
  zipcode: attr()
  country_id: attr()
  phone: attr()
)

App.Address.reopenClass(
  rootKey: null
  collectionKey: "address"
  url: "#{App.get('apiURL')}/addresses"
  adapter: Ember.RESTAdapter.create()
)