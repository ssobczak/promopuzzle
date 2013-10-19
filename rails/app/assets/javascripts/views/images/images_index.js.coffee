class Promopuzzle.Views.ImagesIndex extends Backbone.View

  template: JST['images/index']

  initialize: ->
  	@collection.on('sync', @render)

  render: =>
  	$(@el).html(@template(images: @collection))
  	this