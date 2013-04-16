# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  if ($('#lesson_marks_chart').length)
    $('#lesson_marks_chart').highcharts({
      title: { text: 'Orders by Day' },
      xAxis: { type: 'datetime' },
      yAxis: {
      title: { text: 'Dollars'}
      },
      series: [{
               data: [5, 2, 3, 7, 6]
               }]
    })

  if ($('#lesson_presence_pie').length)
    $('#lesson_presence_pie').highcharts({
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
      },
      title: {
        text: 'Student Presence'
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage}%</b>',
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
        name: 'Student Presence',
        data: [
          ['Present',   45.0],
          ['Missing',    55.0],
        ]
      }]
    })