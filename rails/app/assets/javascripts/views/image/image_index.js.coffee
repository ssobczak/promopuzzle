class Promopuzzle.Views.ImageIndex extends Backbone.View

  template: JST['image/index']

  initialize: ->
  	console.log('init image template')

  render: =>
  	$(@el).html('IMAGE TEMPLATE')  	
  	this


