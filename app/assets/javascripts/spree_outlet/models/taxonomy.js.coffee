attr = Ember.attr

App.Taxonomy = Ember.Model.extend(
  id: attr()
  name: attr()
  parent_id: attr()
  permalink: attr()
  pretty_name: attr()
  taxonomy_id: attr()
  root: Ember.computed ->
    dataRoot = @get('data.root')
    if dataRoot
      @.constructor.create(dataRoot)
    else
      null
  .property('data.root')
  taxons: Ember.computed ->
    taxons = @get('data.taxons')
    klass = @
    taxons = if taxons then taxons else @get('data.root.taxons')
    if !Ember.isEmpty(taxons)
      taxons.map( (item) ->
        App.Taxon.create(item)
        # App.Taxon.load(item.id, item)
        # App.Taxon.find(item.id)
      )
    else
      []
  .property('data.taxons.@each')
)

App.Taxonomy.reopenClass(
  url: "/api/taxonomies"
  rootKey: null
  collectionKey: "taxonomies"
)