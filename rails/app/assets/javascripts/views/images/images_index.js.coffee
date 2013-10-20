class Promopuzzle.Views.ImagesIndex extends Backbone.View

  template: JST['images/index']

  initialize: ->
  	@collection.on('sync', @render)

  render: =>
  	@collection.each( (img) -> 
  		imgView = new Promopuzzle.Views.Image()
  		imgView.
  	)
  	$(@el).html(@template(images: @collection))  	
  	this


