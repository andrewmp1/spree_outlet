attr = Ember.attr

App.Product = Ember.Model.extend(
  id: attr()
  name: attr()
  description: attr()
  price: attr()
  available_on: attr()
  permalink: attr()
  meta_escription: attr()
  meta_keywords: attr()
  option_types: attr()
  taxons: Ember.computed ->
    data = @get('data.taxon_ids')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.Taxon.find(item)
      )
  .property('data.taxon_ids')
  properties: Ember.computed ->
    data = @get('data.product_properties')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.Variant.create(item)
      )
  .property('data.product_properties')
  variants: Ember.computed ->
    data = @get('data.variants')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.Variant.create(item)
      )
  .property('data.variants')
  masterVariant: Ember.computed ->
    @get('variants').findProperty('is_master', true)
  .property('variants.@each')
)

App.Product.reopenClass(
  url: "/api/products"
  rootKey: null
  collectionKey: "products"
)
