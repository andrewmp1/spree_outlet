attr = Ember.attr

App.Adjustment = Ember.Model.extend(
  id: attr()
  amount: attr()
  label: attr()
  source_id: attr()
  source_type: attr()
  adjustable_type: attr()
  adjustable_id: attr()
  originator_type: attr()
  originator_id: attr()
  mandatory: attr()
  eligible: attr()
  created_at: attr()
  updated_at: attr()
)