App.CartController = Ember.ObjectController.extend(
  model: null
  couponCode: null
  addItem: (variantId, quantity) ->
    model = @get('model')
    if !model
      # Define a method on order class to create w/ item
      model = App.Order.createWithItem(variantId, quantity)
      # Need to handle failure on creating new item.
      @set('model', model)
      model
    else
      model.addItem(variantId, quantity)

  applyCoupon: (coupon)->
    coupon = coupon || @get('couponCode')
    console.log("COUPON #{coupon}")
    if coupon
      order = @get('model')
      data =
        order:
          coupon_code: "#{coupon}"
      @updateOrder(data)

    

  empty: ->
    # Hit the api to empty items in the order?
    @get('model').empty()
    @set('model', null)

  # checkout event
  checkout: ->
    state = @get('model.state')
    if state && state != 'cart'
      @transitionToRoute('checkout')
    else
      controller = @
      @updateOrder()
      .then( ->
        controller.transitionToRoute('checkout')
      )
    

  clearFields: ->
    @setProperties(
      couponCode: null
    )

  updateOrder: (data) ->
    data = data || null
    order = @get('model')
    url = "#{order.constructor.url}/#{@get('model.number')}"
    App.ajax(url, data, "PUT")
    .then( (data) ->
      order.set('model.state', data.state)
      data
    )

)