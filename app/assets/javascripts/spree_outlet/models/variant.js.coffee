###
{"id":1,"name":"Ruby on Rails Tote","sku":"ROR-00011","price":"15.99","weight":null,"height":null,"width":null,"depth":null,"is_master":true,"cost_price":"17.0","permalink":"ruby-on-rails-tote","option_values":[],"images":[{"id":21,"position":1,"attachment_content_type":"image/jpeg","attachment_file_name":"ror_tote.jpeg","type":"Spree::Image","attachment_updated_at":"2013-05-21T04:13:38Z","attachment_width":360,"attachment_height":360,"alt":null,"urls":{"mini":"/spree/products/21/mini/ror_tote.jpeg?1369109618","small":"/spree/products/21/small/ror_tote.jpeg?1369109618","product":"/spree/products/21/product/ror_tote.jpeg?1369109618","large":"/spree/products/21/large/ror_tote.jpeg?1369109618"}}
###
App.Variant = DS.Model.extend(
  name: DS.attr('string')
  sku: DS.attr('string')
  price: DS.attr('string')
  weight: DS.attr('string')
  height: DS.attr('string')
  width: DS.attr('string')
  depth: DS.attr('string')
  isMaster: DS.attr('string')
  costPrice: DS.attr('string')
  permalink: DS.attr('string')
  images: DS.hasMany('App.Image')
  optionValues: DS.hasMany('App.OptionValue')
)