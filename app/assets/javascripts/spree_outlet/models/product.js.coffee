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
  taxon_ids: attr()
  option_types: attr()
  product_properties: attr()
  primaryImage: Ember.computed ->
    images = @get('images')
    if !images
      return
    else
      images.objectAt(0).get('attachment_url')

  variants: Ember.computed ->
    id = @get('id')
    model = @
    records = Ember.A()
    if id
      records = App.Variant.find(product_id: @get('id'))
    else
      @then(->
        id = model.get('id')
        App.Variant.find(product_id: @get('id'))
      ).then( (variants) ->
        variants.forEach( (v) ->
          records.pushObject(v)
        )
      )
    records
  .property('id', 'isLoaded')
)

App.Product.reopenClass(
  url: "/api/products"
  rootKey: "product"
  collectionKey: "products"
)
