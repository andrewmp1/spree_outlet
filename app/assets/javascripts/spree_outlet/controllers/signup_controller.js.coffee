App.SignupController = Ember.Controller.extend(
  email: null,
  password: null,
  password_confirmation: null
  error: null
  
  signup: ->
    controller = @
    data = @getProperties('email', 'password', 'password_confirmation')
    settings =
      url: "/api/users.json"
      type: "POST"
      dataType: "json"
      data:
        user: data
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
        password: null
        password_confirmation: null
        error: error
      )
    )
    promise


  clearFields: ->
    @setProperties(
      email: null,
      password: null,
      password_confirmation: null
      error: null
    )
)