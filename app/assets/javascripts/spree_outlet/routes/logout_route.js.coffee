# Route is simply here to expose a url to hit
# for logging out a user.
# Clear session and redirect to home page.
App.LogoutRoute = Ember.Route.extend(

  redirect: ->
    # FIXME clear session & other data.
    if App.currentUser
      App.set('currentUser', undefined)
    @transitionTo('index')
)