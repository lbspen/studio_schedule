# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#datepicker").datepicker dateFormat: "yy-mm-dd"
    $(".pick-time").timepicker(
        minTime: "9:00:00",
        maxTime: "19:00:00"
        )
    $("#calendar").fullCalendar
        header:
            left: "prev, next, today"
            center: "title"
            right: "month, agendaWeek, agendaDay"

        eventSources: [{
            url: '/timeslots.json'
        }]

        error: console.log(arguments[0])
