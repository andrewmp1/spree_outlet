App.ajax = (url, params, method) ->
  token = App.get('token')
  if !method
    method = "GET"
 
  settings =
    url: url
    type: method
    dataType: "json"

  if token
    settings.headers = "X-Spree-Token": token


  if params
    settings.data = params

  if params && method != "GET"
    settings.contentType = "application/json; charset=utf-8";
    settings.data = JSON.stringify(params);

  Ember.$.ajax(settings);

Ember.RESTAdapter.reopen(
  _ajax: App.ajax
)

Ember.Model.reopenClass(
  adapter: Ember.RESTAdapter.create()
)