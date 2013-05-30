# Make sure to namespace your route at the same path as you mount your engine
# In order to use history you'll need to namespace
# the whole ember route  under a nested resource ?
# App.Router.reopen(
#   location: 'history'
# )

App.Router.map ->
  @resource('products', ->
    @resource('product', path: '/:permalink')
  )
  @resource('account')
  @resource('cart')
  @resource('checkout')
  @route('login')

  # 404, Catch all unmatched routes
  @route('notFound', path: '/*path')
