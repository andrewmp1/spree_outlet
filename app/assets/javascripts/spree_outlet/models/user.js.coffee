attr = Ember.attr

App.User = Ember.Model.extend(
  id: attr()
  email: attr()
)

App.User.reopenClass(
  url: "#{App.get('apiURL')}/users"
  rootKey: null
  collectionKey: 'users'
)

