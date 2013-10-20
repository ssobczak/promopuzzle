class Promopuzzle.Routers.Images extends Backbone.Router

	routes:
		'': 'index'

	initialize: ->
		@collection = new Promopuzzle.Collections.Images()
		@collection.fetch({ 
			data: $.param({ user_id: 1}),
			success: @fetchParts
	    })

	index: =>
		$("#container").html('')

	fetchParts: => 
		@collection.each((image) -> 
			image.cparts = new Promopuzzle.Collections.Parts()
			image.cparts.fetch({ 
				data: $.param({ user_id: 1, image_id: image.get('id') }),
				success: =>
					view = new Promopuzzle.Views.ImageIndex(collection: image)
					$("#container").append(view.render().el);
			})
		)

	drawImage: =>
			console.log('draw')
