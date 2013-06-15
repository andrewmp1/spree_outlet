Ember.Handlebars.helper('money', (value)->
	"$" + parseFloat(value).toFixed(2)
)