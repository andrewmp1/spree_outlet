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

App.Store = DS.Store.extend(
  revision: 12
)
removeMeta = 
DS.RESTAdapter.configure("plurals",
  product_properties: "product_properties"
)
DS.RESTAdapter.reopen(
  namespace: "api"
  didFindAll: (store, type, payload, recordArray) ->
    loader = DS.loaderFor(store)
    serializer = @get('serializer')

    delete payload.count
    delete payload.total_count
    delete payload.current_page
    delete payload.pages

    store.didUpdateAll type
    serializer.extractMany(loader, payload, type)

  didFindQuery: (store, type, payload, recordArray) ->
    loader = DS.loaderFor(store)
    loader.populateArray = (data) ->
      recordArray.load data
      
      # This adds the meta property returned from the server
      # onto the recordArray sent back
      recordArray.setProperties(
        count: payload.count
        totalCount: payload.total_count
        currentPage: payload.current_page
        pages: payload.pages
      )
      delete payload.count
      delete payload.total_count
      delete payload.current_page
      delete payload.pages

    @get("serializer").extractMany(loader, payload, type)
)
DS.RESTAdapter.map("App.Order",
  primaryKey: 'number'
)