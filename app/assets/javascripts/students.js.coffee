# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
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