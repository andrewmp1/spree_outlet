attr = Ember.attr

App.PaymentMethod = Ember.Model.extend(
  id: attr()
  name: attr()
  description: attr()
)
