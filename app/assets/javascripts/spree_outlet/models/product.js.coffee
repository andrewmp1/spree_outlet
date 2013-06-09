attr = Ember.attr

App.Product = Ember.Model.extend(
  id: attr()
  name: attr()
  description: attr()
  price: attr()
  available_on: attr()
  permalink: attr()
  meta_description: attr()
  meta_keywords: attr()
  option_types: Ember.computed ->
    data = @get('data.option_types')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.OptionType.create(item)
      )
  .property('data.option_types')
  taxons: Ember.computed ->
    data = @get('data.taxon_ids')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.Taxonomy.find(item)
      )
  .property('data.taxon_ids')
  properties: Ember.computed ->
    data = @get('data.product_properties')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.ProductProperty.create(item)
      )
  .property('data.product_properties')
  variants: Ember.computed ->
    data = @get('data.variants')
    if !Ember.isEmpty(data)
      data.map( (item) ->
        App.Variant.create(item)
      )
  .property('data.variants')
  master: Ember.computed ->
    @get('variants').findProperty('is_master', true)
  .property('variants.@each')
  hasVariants: Ember.computed ->
    @get('variants.length') > 1
  .property('variants.@each')
  mainImage: Ember.computed ->
    @get('master.images').objectAt(0)
  .property('master')
)

App.Product.reopenClass(
  url: "/api/products"
  rootKey: null
  collectionKey: "products"
)
