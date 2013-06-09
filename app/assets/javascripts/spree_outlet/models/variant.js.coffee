###
{"id":1,"name":"Ruby on Rails Tote","sku":"ROR-00011","price":"15.99","weight":null,"height":null,"width":null,"depth":null,"is_master":true,"cost_price":"17.0","permalink":"ruby-on-rails-tote","option_values":[],"images":[{"id":21,"position":1,"attachment_content_type":"image/jpeg","attachment_file_name":"ror_tote.jpeg","type":"Spree::Image","attachment_updated_at":"2013-05-21T04:13:38Z","attachment_width":360,"attachment_height":360,"alt":null,"urls":{"mini":"/spree/products/21/mini/ror_tote.jpeg?1369109618","small":"/spree/products/21/small/ror_tote.jpeg?1369109618","product":"/spree/products/21/product/ror_tote.jpeg?1369109618","large":"/spree/products/21/large/ror_tote.jpeg?1369109618"}}
###
attr = Ember.attr

App.Variant = Ember.Model.extend(
  id: attr()
  name: attr()
  sku: attr()
  price: attr()
  weight: attr()
  height: attr()
  width: attr()
  depth: attr()
  images: attr()
  is_master: attr()
  cost_price: attr()
  permalink: attr()
  option_values: attr()
  image: Ember.computed ->
    images = @get('data.images')
    if images
      images.map( (item) ->
        App.Image.create(item)
      )
    else
      Ember.A()
  .property('data.images')
)

App.Variant.reopenClass(
  url: "/api/variants"
  rootKey: null
  collectionKey: "variants"
)