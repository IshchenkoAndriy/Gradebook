# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('table.visual-editor td.lesson_cell').click( ->
    actions = $(this).find('.actions')
    if actions.children().size() > 1
      actions.slideToggle()
    else
      actions.fadeToggle()
  )
  $('table.visual-editor th.lesson-header').click( ->
    $(this).find('.actions').slideToggle()
  )