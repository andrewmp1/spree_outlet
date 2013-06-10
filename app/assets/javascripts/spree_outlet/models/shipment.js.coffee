attr = Ember.attr

App.Shipment = Ember.Model.extend(
  id: attr()
  tracking: attr()
  number: attr()
  cost: attr()
  state: attr()
  order_id: attr()
  stock_location_name: attr()
  shipping_method: Ember.computed ->
    @get('data.shiping_method.name')
  .property('data.shipping_method')
  shipping_rates: Ember.computed ->
  	shipping_rates = @get('data.shipping_rates')
  	if shipping_rates
    shipping_rates.map( (item) ->
      ShippingRate.create(item)
    )
  .property('data.shipping_rates')
  inventory_units: Ember.computed ->
    inventory_units = @get('data.inventory_units')
    if inventory_units
      inventory_units.map( (item) ->
        Ember.Object.create(item)
      )
  .property('data.inventory_units')
)

App.Shipment.reopenClass(
	url: "/api/shipments"
	rootKey: null
	collectionKey: "shipments"
)