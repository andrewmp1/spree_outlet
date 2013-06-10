# Thanks to nerdyworm for this quick solution from flowfeeds:
# https://github.com/nerdyworm/flowfeeds
App.InfiniteScrollView = Ember.View.extend(
	elementId: 'infinite'
	layout: Ember.Handlebars.compile("{{ yield }}{{ partial loader}}")
	didInsertElement: ->
		view = @
		Ember.$('#main').on('scroll', ->
			view.onScroll()
		)

	willDestroyElement: ->
		Ember.$('#main').off('scroll')

	onScroll: ->
    top = @$().position().top
    height = @$().height()
    containerHeight = Ember.$("#main").height()
    console.log("#{top} #{containerHeight} #{height}")

  isScrolledToBottom: ->
    top = @$().position().top
    height = @$().height()
    containerHeight = Ember.$("#main").height()

    Math.abs(top - containerHeight) >= height - 500
)