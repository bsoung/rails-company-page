# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined
set_positions = undefined

set_positions = ->
	$('.card').each (i) ->
		$(this).attr 'data-pos', i + 1
		return
	return

# declaring a function and storing it inside the ready var
# we want the sortable func called on our sortable div
ready = ->
	set_positions()
	$('.sortable').sortable()
	# sortupdate is from our html.sortable.js, bind to that function
	$('.sortable').sortable().bind 'sortupdate', (e, ui) ->
		updated_order = []

		# take the items that have been sorted and then set positions
		set_positions()

		# take the id you grab from the card, and then go and add into the updated order array
		$('.card').each (i) ->
			updated_order.push
				id: $(this).data('id') 
				position: i + 1
			return

		$.ajax
			type: 'PUT'
			# go to controller sort - need to update our routes.rb
			url: '/portfolios/sort' 
			data: order: updated_order
		return

	return

# when the page loads, pass in this function
$(document).ready ready