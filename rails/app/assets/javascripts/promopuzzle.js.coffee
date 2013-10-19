window.Promopuzzle =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new Promopuzzle.Routers.Parts()
  	Backbone.history.start()

$(document).ready ->
  Promopuzzle.initialize()
 