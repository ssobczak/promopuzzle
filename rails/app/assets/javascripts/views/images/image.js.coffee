class Promopuzzle.Views.Image extends Backbone.View

  template: JST['image/index']

  initialize: ->
  	@collection.cparts.on('sync', @render)

  render: =>
  	console.log(@collection)
  	$(@el).html(@template(image: @collection)) 
  	this


