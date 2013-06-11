attr = Ember.attr

App.Payment = Ember.Model.extend(
  id: attr()
  source_type: attr()
  source_id: attr()
  amount: attr()
  payment_method_id: attr()
  response_code: attr()
  state: attr()
  avs_response: attr()
  created_at: attr()
  updated_at: attr()
)