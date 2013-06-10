attr = Ember.attr
App.ShippingRate = Ember.Model.extend(
	id: attr()
	cost: attr()
	selected: attr()
	shipment_id: attr()
	shipping_method_id: attr()
)