App.SignupRoute = Ember.Route.extend(

  deactivate: ->
    @controllerFor('signup').clearFields()

)