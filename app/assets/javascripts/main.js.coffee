# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  popover = $('.lang_popover').popover({
    placement: 'bottom',
    html: 'true',
    trigger: 'click'})

  $('#feature_slider').nivoSlider(
    {
      effect: 'fade'
    }).data('nivoslider').stop()