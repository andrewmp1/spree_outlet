attr = Ember.attr

App.User = Ember.Model.extend(
  id: attr()
  email: attr()
)

App.User.reopenClass(
  url: "/api/users"
  rootKey: null
  collectionKey: 'users'
)

