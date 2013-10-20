class Promopuzzle.Routers.Images extends Backbone.Router

	routes:
		'': 'index'

	initialize: ->
		@collection = new Promopuzzle.Collections.Images()
		@collection.fetch({ 
			data: $.param({ user_id: 1}),
			success: @drawImages
		})

	drawImages: =>
		view = new Promopuzzle.Views.ImagesIndex(collection: @collection)
		$("#container").append(view.render().el);
