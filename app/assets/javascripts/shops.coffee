# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  loaded_state = $('#shop_state_id :selected').text()
  if loaded_state.length < 1
    $('#shop_state_id').parent().hide()

  states = $('#shop_state_id').html()
  $('#shop_country_id').change ->
    country = $('#shop_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#shop_state_id').html(options)
      $('#shop_state_id').parent().show()
    else
      $('#shop_state_id').empty()
      $('#shop_state_id').parent().hide()

  $("#shop_country_id").trigger "change"
  $("#shop_country_id").parent().hide()