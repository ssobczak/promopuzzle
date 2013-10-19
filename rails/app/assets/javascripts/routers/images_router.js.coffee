class Promopuzzle.Routers.Images extends Backbone.Router

	routes:
		'': 'index'

	initialize: ->
		@collection = new Promopuzzle.Collections.Images()
		@collection.fetch({ 
			data: $.param({ user_id: 1}) ,
			success: @fetchParts
	    })

	index: =>
		view = new Promopuzzle.Views.ImagesIndex(collection: @collection)
		$("#container").html(view.render().el)


	fetchParts: => 
		@collection.each((image) -> 
			image.parts = new Promopuzzle.Collections.Parts()
			image.parts.fetch({ 
				data: $.param({ user_id: 1, image_id : image.get('id') })
			})
		)
