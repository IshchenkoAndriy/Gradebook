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
  if ($('table.visual-editor').length)
    parent_table = $('table.visual-editor')
    parent_div = $('div.visual-editor')

    parent_table_top_offset = parent_table.offset().top
    footer_size = $('#footer').height()
    table_bottom_margin = 5
    table_vertical_margin = parent_table_top_offset + table_bottom_margin + footer_size

    calculate_tables_size = ->
      calculated_table_height = $(window).height() - table_vertical_margin

      if calculated_table_height > parent_table.outerHeight()
        calculated_table_height = parent_table.outerHeight()

      parent_div.css('height', calculated_table_height)

    $(document).ready(  ->
      calculate_tables_size()
    )

    $(window).resize( ->
      calculate_tables_size()
    )