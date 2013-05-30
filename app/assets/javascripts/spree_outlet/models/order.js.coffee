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
    payments = @get('data.payments')
    if payments
      payments.map( (item) ->
        App.Payment.create(item)
      )
    else
      payments
  .property('data.payments'),

  lineItems: Ember.computed ->
    lineItems = @get('data.lineItems')
    if lineItems
      lineItems.map( (item) ->
        App.LineItem.create(item)
      )
    else
      lineItems
  .property('data.lineItems'),

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
  rootKey: null
  collectionKey: "orders"
)