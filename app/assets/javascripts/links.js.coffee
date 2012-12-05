# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  $("#new_link").validate
    errorElement: "div"
    onkeyup: false
    errorPlacement: (error, element) ->
      $(".error_remove").remove()
      error.addClass("error_remove").insertAfter "#title2"

    rules:
      url:
        required: true
        url: true

    messages:
      url:
        required: "Url can't be blank"
        url: "Url must be valid"