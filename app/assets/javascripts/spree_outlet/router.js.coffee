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
  @resource('order', path: '/orders/:number')
  @resource('cart')
  @resource('checkout', ->
    @route('index')
    @route('cart')
    @route('address')
    @route('delivery')
    @route('payment')
    @route('confirm')
    @route('complete')
  )
  @route('login')
  @route('signup')
  @route('logout')

  # 404, Catch all unmatched routes
  @route('notFound', path: '/*path')
