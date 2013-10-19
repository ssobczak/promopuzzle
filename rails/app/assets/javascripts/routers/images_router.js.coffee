class Promopuzzle.Routers.Images extends Backbone.Router

	routes:
		'': 'index'

	initialize: ->
		@collection = new Promopuzzle.Collections.Images()
