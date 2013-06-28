# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#datepicker").datepicker dateFormat: "yy-mm-dd"
    $(".pick-time").timepicker(
        minTime: "9:00:00",
        maxTime: "19:00:00"
        )
    $("#calendar").once("#calendar").fullCalendar
        header:
            left: "prev, next, today"
            center: "title"
            right: "month, agendaWeek, agendaDay"

        eventSources: [{
            url: '/timeslots.json'
        }]

        error: console.log(arguments[0])

    $("li input").on 'click', ->
        cost_data = $(@).next("label").data("cost")
        cost_estimate = Number($("#cost_estimate").text())

        if $(@).is(":checked")
            cost_estimate += cost_data
        else
            cost_estimate = cost_estimate - cost_data
        $("#cost_estimate").text(cost_estimate)

