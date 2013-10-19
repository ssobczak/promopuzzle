class Promopuzzle.Routers.Images extends Backbone.Router

	routes:
		'': 'index'

	initialize: ->
		@collection = new Promopuzzle.Collections.Images()
		@collection.fetch()

	index: =>
		view = new Promopuzzle.Views.ImagesIndex(collection: @collection)
		$("#container").html(view.render().el)