# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'load turbolinks:load', ->
    $("div.bhoechie-tab-menu>div.list-group>a").on 'click', ->
        e.preventDefault()
        $(this).siblings('a.active').removeClass("active")
        $(this).addClass("active")
        index = $(this).index()
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active")
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active")