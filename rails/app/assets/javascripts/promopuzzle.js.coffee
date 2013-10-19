window.Promopuzzle =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new Promopuzzle.Routers.Images()
  	Backbone.history.start()

$(document).ready ->
  Promopuzzle.initialize()
 