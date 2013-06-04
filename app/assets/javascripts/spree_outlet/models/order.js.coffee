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
  number: attr()
  email: attr()
  state: attr()
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
  special_instructions: attr()
  token: attr()

  payments: Ember.computed ->
    payments = @get('data.payments')
    if payments
      payments.map( (item) ->
        App.Payment.create(item)
      )
    else
      payments
  .property('data.payments'),

  shipments: Ember.computed ->
    shipments = @get('data.shipments')
    if shipments
      shipments.map( (item) ->
        App.Shipment.create(item)
      )
  .property('data.shipments')

  lineItems: Ember.computed ->
    lineItems = @get('data.line_items')
    if lineItems
      lineItems.map( (item) ->
        App.LineItem.create(item)
      )
    else
      lineItems
  .property('data.line_items'),

  billAddress: Ember.computed ->
    #TODO
    App.Address.create(billAddress)
  .property('data.bill_address')

  shipAddress: Ember.computed ->
    #TODO
    App.Address.create(shipAddress)
  .property('data.ship_address')

  adjustments: Ember.computed ->
    adjustments = @get('data.adjustments')
    if adjustments
      adjustemnts.map( (item) ->
        App.Adjustment.create(item)
      )
  .property('data.adjustments')

  accessToken: ->
    App.get('token') || @get('token')

  addItem: (variantId, quantity) ->
    accessToken = @accessToken()
    controller = @
    settings =
      url: "/api/checkouts/#{@get('number')}"
      type: "PUT"
      data:
        line_item:
          variant_id: variantId
          quantity: quantity
    # if accessToken
    #   settings.url = settings.url + "?token=#{accessToken}"
    Ember.$.ajax(settings).then((data) ->
      if data.line_items
        controller.set('data.line_items', data.line_items)
    )

  empty: ->
    settings =
      url: "/api/orders/#{@get('number')}/empty"
      type: "PUT"
    Ember.$.ajax(settings)

  taxTotal: Ember.computed ->
    adjustments = @get('adjustments')
    if adjustments
      adjustments.filterProperty('type', 'tax')
  .property('adjustments')

  shipTotal: Ember.computed ->
    adjustments = @get('adjustments')
    if adjustments
      adjustments.filterProperty('type', 'shipping')
  .property('adjustments')

  isPaid: Ember.computed ->
    @get('payment_state') == 'paid'
  .property('payment_state')

  name: Ember.computed ->
    address = @get('shipAddress') || @get('billAddress')
    if address
      "#{address.firstname} #{address.lastname}"
  .property('ship_address', 'bill_address')

  itemCount: Ember.computed ->
    lineItems = @get('line_items')
    if lineItems
      lineItems.get('length')
  .property('lineItems')

  checkoutAllowed: Ember.computed ->
    !Ember.isEmpty(@get('lineItems'))
  .property('lineItems')

  paymentRequired: Ember.computed ->
    parseFloat(@get('total')) > 0.0
  .property('total')

  isComplete: Ember.computed ->
    !Ember.isEmpty(@get('completed_at'))
  .property('completed_at')
)

App.Order.reopenClass(
  url: "/api/orders"
  rootKey: null
  collectionKey: "orders"
  createWithItem: (variantId, quantity) ->
    record = @.create()
    settings =
      url: "/api/orders.json?order[line_items][0][variant_id]=#{variantId}&order[line_items][0][quantity]=#{quantity}"
      type: "POST"
    Ember.$.ajax(settings).then((json) ->
      record.load(json.id, json)
    )
    record


)