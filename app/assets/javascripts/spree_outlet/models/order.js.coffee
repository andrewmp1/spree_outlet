attr = Ember.attr

window.billAddress =
  "firstname": "John"
  "lastname": "Doe"
  "address1": "7735 Old Georgetown Road"
  "city": "Bethesda"
  "phone": "3014445002"
  "zipcode": "20814"
  "state_id": 1
  "country_id": 1

window.shipAddress =
  "firstname": "John"
  "lastname": "Doe"
  "address1": "7735 Old Georgetown Road"
  "city": "Bethesda"
  "phone": "3014445002"
  "zipcode": "20814"
  "state_id": 1
  "country_id": 1

App.Order = Ember.Model.extend(
  _payments: null,
  _lineItems: null,
  id: attr()
  state: attr()
  number: attr()
  item_total: attr()
  total: attr()
  adjustment_total: attr()
  user_id: attr()
  created_at: attr()
  updated_at: attr()
  completed_at: attr()
  payment_total: attr()
  shipment_state: attr()
  payment_state: attr()
  email: attr()
  special_instructions: attr()

  payments: Ember.computed ->
    payments = @get('_payments')
    if payments
      payments
    else
      payments
  .property('_payments'),

  lineItems: Ember.computed ->
    lineItems = @get('_lineItems')
    if lineItems
      lineItems
    else
      lineItems
  .property('_lineItems'),

  addItem: (variantId, quantity) ->
    settings =
      url: "/api/orders/#{@get('number')}/line_items?line_item[variant_id]=#{variantId}&line_item[quantity]=#{quantity}"
      type: "POST"
    Ember.$.ajax(settings)

  empty: ->
    settings -
      url: "/api/orders/#{@get('number')}/empty"
      type: "PUT"
    Ember.$.ajax(settings)
)

App.Order.reopenClass(
  url: "/api/orders"
  rootKey: "order"
  collectionKey: "orders"
  adapter: Ember.RESTAdapter.create()
)