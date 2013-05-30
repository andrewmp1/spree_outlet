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

App.Order = DS.Model.extend(
  id: DS.attr('string')
  number: DS.attr('string')
  state: DS.attr('string')
  item_total: DS.attr('string')
  total: DS.attr('string')
  adjustment_total: DS.attr('string')
  user_id: DS.attr('string')
  created_at: DS.attr('string')
  updated_at: DS.attr('string')
  completed_at: DS.attr('string')
  payment_total: DS.attr('string')
  shipment_state: DS.attr('string')
  payment_state: DS.attr('string')
  email: DS.attr('string')
  special_instructions: DS.attr('string')
  lineItems: DS.hasMany('App.LineItem')
  payments: DS.hasMany('App.Payment')

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