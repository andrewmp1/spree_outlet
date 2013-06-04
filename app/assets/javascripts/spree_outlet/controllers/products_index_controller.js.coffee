App.ProductsIndexController = Ember.ArrayController.extend(
  # Simple filter by taxon id for now
  # Api request to filter by taxon:
  # /api/products.json?q[taxons_id_eq]=4
  filter: null
  filtered: Ember.computed ->
    filter= @get('filter')
    models = @get('model')
    if filter
      models.filter( (item) ->
        taxon_ids = item.get('data.taxon_ids')
        if taxon_ids
          taxon_ids.indexOf(parseInt(filter)) != -1
        else
          false
      )
    else
      models
  .property('model', 'filter')
  filterProducts: (taxon) ->
    @set('filter', taxon.get('id'))
  clearFilter: ->
    @set('filter', null)
)