App.LoginController = Ember.Controller.extend(
  login: null
  password: null
  error: null

  login: ->
    controller = @
    data = @getProperties('login', 'password')
    settings =
      url: "/api/session.json"
      type: "POST"
      dataType: "json"
      data:
        session: data
    promise = Ember.$.ajax(settings)
    promise.then( (data) ->
      App.setProperties(
        currentUser: App.User.create(data)
        token: data.spree_api_key
      )
      controller.transitionToRoute('products')
    , (jqXHR, textStatus, errorThrown) ->
      error = "An error occured."
      if jqXHR.responseText
        error = jqXHR.responseText
      controller.setProperties(
        error: error
        password: null
      )

    )
    promise

  clearFields: ->
    @setProperties(
      email: null
      password: null
      error: null
    )
)