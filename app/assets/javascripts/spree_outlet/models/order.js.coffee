attr = Ember.attr

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

  calculatedTotal: Ember.computed ->
    lineItems = @get('lineItems') || []
    lineItemsTotal = lineItems.mapProperty('total').reduce((a,b) ->
      parseFloat(a) + parseFloat(b)
    , 0)
    if lineItems && @get('item_total') != lineItemsTotal
      parseFloat(parseFloat(@get('adjustment_total')) + lineItemsTotal).toFixed(2)
    else
      @get('total')
  .property('total', 'adjustment_total', 'lineItems.@each', 'item_total')

  order_date: Ember.computed ->
    date = @get('completed_at') || @get('created_at')
    date
  .property('completed_at', 'created_at')

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
        App.Shipment.createRecord(item)
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
      adjustments.map( (item) ->
        App.Adjustment.create(item)
      )
    else
      Ember.A()
  .property('data.adjustments')

  accessToken: ->
    App.get('token') || @get('token')

  # This could be changed to add multiple items at once.
  addItem: (variantId, quantity) ->
    model = @
    token = @get('token')
    url = "#{@.constructor.url}/#{@get('number')}"
    if token
      url = url + "?order_token=#{token}"
    data = 
      order:
        line_items_attributes: [
          variant_id: variantId
          quantity: quantity
        ]

    App.ajax(url, data, "PUT")
    .then( (data) ->
      model.load(data.number, data)
    )

  empty: ->
    model = @
    App.ajax("#{@.constructor.url}/#{@get('number')}/empty", null, "PUT")
    .then( (data) ->
      model.load(model.get('number'), {})
    )

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
  url: "#{App.get('apiURL')}/orders"
  rootKey: null
  collectionKey: "orders"
  createWithItem: (variantId, quantity) ->
    record = @.create()
    url = "#{@url}?order[line_items][0][variant_id]=#{variantId}&order[line_items][0][quantity]=#{quantity}"
    App.ajax(url, null, "POST")
    .then((json) ->
      record.load(json.number, json)
    )
    record
)