App.ajax = (url, params, method) ->
  token = App.get('token')
  if !method
    method = "GET"
 
  settings =
    url: url
    type: method
    dataType: "json"

  if token
    settings.headers = "X-SPREE-TOKEN": token


  if params
    settings.data = params

  if params && method != "GET"
    settings.contentType = "application/json; charset=utf-8"
    settings.data = JSON.stringify(params)

  Ember.$.ajax(settings)

Ember.RESTAdapter.reopen(
  _ajax: App.ajax
  findAll: (klass, records) ->
    url = this.buildURL(klass)
    collectionKey = klass.collectionKey

    @ajax(url).then( (data) ->
      dataToLoad = if collectionKey then data[collectionKey] else data
      records.setProperties(
        count: data.count
        total_count: data.total_count
        pages: data.pages
        current_page: data.current_page
      )
      Ember.run(records, records.load, klass, dataToLoad)
    )

  findQuery: (klass, records, params) ->
    url = this.buildURL(klass)
    collectionKey = klass.collectionKey

    @ajax(url, params).then( (data) ->
      dataToLoad = if collectionKey then data[collectionKey] else data
      records.setProperties(
        count: data.count
        total_count: data.total_count
        pages: data.pages
        current_page: data.current_page
      )
      Ember.run(records, records.load, klass, dataToLoad)
    )

  search: (klass, records, query) ->
    url = this.buildURL(klass)
    collectionKey = klass.collectionKey
    keys = Ember.keys(query)
    console.log("HERE")
    key = keys.objectAt(0)
    url = this.buildUrl(klass) + "?q[" + key + "]=" + query[key]
    @ajax(url).then( (data) ->
      dataToLoad = if collectionKey then data[collectionKey] else data
      records.setProperties(
        count: data.count
        total_count: data.total_count
        pages: data.pages
        current_page: data.current_page
      )
      Ember.run(records, records.load, klass, dataToLoad)
    )
)

Ember.Model.reopenClass(
  adapter: Ember.RESTAdapter.create()
  search: (query) ->
    records = Ember.RecordArray.create()
    @get('adapter').search(@, records, query)
)