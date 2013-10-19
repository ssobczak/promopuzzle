class Promopuzzle.Views.ImagesIndex extends Backbone.View

  template: JST['images/index']

  initialize: ->
  	@collection.on('sync', @render)

  render: =>
  	$(@el).html(@template(images: @collection))  	
  	@test(a) for a in @collection
  	this


  test: (a) => 
  	console.log('a')	