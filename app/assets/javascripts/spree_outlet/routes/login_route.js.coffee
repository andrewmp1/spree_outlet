App.LoginRoute = Ember.Route.extend(

  deactivate: ->
    @controllerFor('login').clearFields()

)