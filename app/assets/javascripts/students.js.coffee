# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if ($('#names').length && $('#marks').length)
    parent_table = $('#sizable_table')
    marks_table = $('#marks')
    names_table = $('#names')
    lessons_table = $('#lessons')

    marks_table_rows = $('#marks tr')
    marks_table_body = $('#marks tbody')
    names_table_rows = $('#names tr')
    marks_table_columns = $('.table_marks td')
    parent_table_top_offset = parent_table.offset().top
    footer_size = $('#footer').height()
    table_bottom_margin = 20
    parent_table_header_size = 75
    table_vertical_margin = parent_table_top_offset + parent_table_header_size + table_bottom_margin + footer_size

#    ***************************************
#    Create the measurement node
    scrollDiv = document.createElement("div");
    scrollDiv.className = "scrollbar-measure";
    document.body.appendChild(scrollDiv);

#    Get the scrollbar width
    scrollbarWidth = scrollDiv.offsetWidth - scrollDiv.clientWidth;

#     Delete the DIV
    document.body.removeChild(scrollDiv);

    if scrollbarWidth <= 0
      scrollbarWidth = 15
#    ***************************************

    have_hscroll_bar = (parent, child) ->
      child.innerWidth() >= parent.innerWidth()

    marks_table.scroll( ->
      lessons_table.scrollLeft(marks_table.scrollLeft())
      names_table.scrollTop(marks_table.scrollTop())
    )

    resize_table_columns = ->
      $.each( $('.table_marks_header th'), (index, header_cell) ->
        max_value = header_cell.clientWidth

        data_cell = marks_table_columns[index]
        if max_value < data_cell.clientWidth
          max_value = data_cell.clientWidth

        header_cell.style.width = max_value + 'px'
        header_cell.style.minWidth = max_value + 'px'
        data_cell.style.width = max_value + 'px'
        data_cell.style.minWidth = max_value + 'px'
      )

    resize_table_rows = ->
      $.each(names_table_rows, (index, value) ->
        marks_table_rows[index].style.height = value.offsetHeight + 'px'
      )

    calculate_tables_size = ->
      if have_hscroll_bar marks_table, marks_table_rows
        hscrollbar_height = scrollbarWidth
      else
        hscrollbar_height = 0

      min_table_height = hscrollbar_height

      calculated_table_height = $(window).height() - table_vertical_margin
      if calculated_table_height > min_table_height
        min_table_height = calculated_table_height

      vscrollbar_height = scrollbarWidth
      if calculated_table_height > marks_table_body.outerHeight() + hscrollbar_height
        min_table_height = marks_table_body.outerHeight() + hscrollbar_height
        vscrollbar_height = 0

      marks_table.css('height', min_table_height)
      names_table.css('height', min_table_height - hscrollbar_height)
      lessons_table.css('width', marks_table.width() - vscrollbar_height)

    $(document).ready(  ->
      resize_table_rows()
      resize_table_columns()
      calculate_tables_size()
    )

    $(window).load( ->
      resize_table_rows()
      resize_table_columns()
      calculate_tables_size()
    )

    $(window).resize( ->
      resize_table_rows()
      calculate_tables_size()
    )

  Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, (color) ->
    {
      radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
      stops: [
        [0, color],
        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]
      ]
    }
  )

  if ($('#modulus_chart').length)
    $('#modulus_chart').highcharts({
      data: {
        table: document.getElementById('modulus')
      },
      chart: {
        type: 'bar'
      },
      plotOptions: {
        series: {
          stacking: 'normal'
          dataLabels: {
#            enabled: true,
            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
          }
        }
      },
      legend: {
        backgroundColor: '#FFFFFF',
        reversed: true
      },
      title: {
        text: I18n.t('modules_chart_title')
      },
      yAxis: {
        allowDecimals: false,
        title: {
          text: I18n.t('score_title')
        }
        stackLabels: {
          enabled: true,
          style: {
              fontWeight: 'bold',
              color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
          }
        }
      },
      tooltip: {
        formatter: ->
          '<b>' + this.x + '</b><br/>' + this.series.name + ' ' + I18n.t('module_score_title') + ' ' + this.y
      }
    })

  if ($('#lesson_marks_chart').length)
    $('#lesson_marks_chart').highcharts({
      chart: {
        type: 'line'
      }
      data: {
        table: document.getElementById('lesson_marks')
      },
      title: { text: I18n.t('marks_title') },
      yAxis: {
        allowDecimals: false,
        title: { text: I18n.t('score_title')}
      }
    })

  if ($('#lesson_presence_pie').length)
    $('#lesson_presence_pie').highcharts({
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
      },
      title: {
        text: I18n.t('presence_title')
      },
      tooltip: {
        pointFormat: '<b>{point.percentage}%</b>',
        percentageDecimals: 1
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            color: '#000000',
            connectorColor: '#000000'
          }
        }
      },
      series: [{
        type: 'pie',
        name: I18n.t('presence_title'),
        data: [
          [$('#lesson_presence tr th:last-child').text(), parseInt($('#lesson_presence tr td:last-child').text())],
          [$('#lesson_presence tr th:first-child').text(), parseInt($('#lesson_presence tr td:first-child').text())]
        ]
      }]
    })

  if ($('#subject_module_marks_chart').length)
    $('#subject_module_marks_chart').highcharts({
      data: {
        table: document.getElementById('subject_module_marks')
      },
      chart: {
          type: 'column'
      },
      title: {
          text: $('#subject_module_marks tr th:first-child').text()
      },
      yAxis: {
          min: 0,
          title: {
              text: I18n.t('score_title')
          },
          stackLabels: {
              enabled: true,
              style: {
                  fontWeight: 'bold',
                  color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
              }
          }
      },
      legend: {
        align: 'right',
        x: -100,
        verticalAlign: 'top',
        y: 20,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
        reversed: true
      },
      tooltip: {
        formatter: ->
          '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y + '<br/>' + I18n.t('total_title') + this.point.stackTotal
      },
      plotOptions: {
          column: {
              stacking: 'normal',
              dataLabels: {
                  enabled: true,
                  color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
              }
          }
      }
    })