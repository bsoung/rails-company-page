# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

# declaring a function and storing it inside the ready var
# we want the sortable func called on our sortable div
ready = ->
	$('.sortable').sortable()
	return

# when the page loads, pass in this function
$(document).ready ready