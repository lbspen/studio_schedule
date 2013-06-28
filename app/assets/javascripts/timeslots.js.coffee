# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

    $("#datepicker").datepicker dateFormat: "yy-mm-dd"
    $(".pick-time").timepicker(
        minTime: "9:00:00",
        maxTime: "19:00:00"
        )
    # calculate hours for studio
    # $(".pick-time").on 'change', ->
    #     fulltimeval = $(@).val().slice(0,4).split(":")
    #     hour = fulltimeval[0]
    #     minute = fulltimeval[1]
    #     stamp = $(@).val().slice(4)
    #     if (stamp == 'pm')
    #         hour = hour + 12
    #     minutes = (hour*60) + minute
    #     $(@).setAttribute('data-minutes', minutes)
    #     s = $('#timeslot_start_time').data('minutes')
    #     e = $('#timeslot_end_time').data('minutes')
    #     studio_hours = (e-s)/60
    #     $("#studio_hours").text(studio_hours)

    $("#calendar").fullCalendar
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

    $("label#other").prev("input").on 'click', ->
        console.log "hi"
        $("#other_text_input").toggle('show')

        alert("Diff in seconds: " + (second - first))

