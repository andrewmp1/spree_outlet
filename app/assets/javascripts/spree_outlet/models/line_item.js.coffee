attr = Ember.attr

App.LineItem = Ember.Model.extend(
  id: attr()
  price: attr()
  quantity: attr()
  variant_id: attr()
  total: Ember.computed ->
    parseFloat(@get('quantity')*@get('price')).toFixed(2)
  .property('quantity', 'price')
  variant: Ember.computed ->
    if arguments.length == 2
      @set('data.variant', arguments[1].toJSON())
    else
      variant = @get('data.variant')
      if variant
        App.Variant.create(variant)
      else
        # shouldn't reach this state
        App.Variant.find(@get('variant_id'))
  .property('data.variant')
)