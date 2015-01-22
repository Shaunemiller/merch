# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
 # You can use CoffeeScript in this file: http://coffeescript.org/

#
# * Replace all SVG images with inline SVG
#
swapSvgs = ->
  $("img").each ->
    $img = $(this)
    imgID = $img.attr("id")
    imgClass = $img.attr("class")
    imgURL = $img.attr("src")
    matchSVG = /(.+\.svg)/

    if matchSVG.test(imgURL)

      $.get imgURL, ((data) ->

        # Get the SVG tag, ignore the rest
        $svg = $(data).find("svg")


        # Add replaced image's ID to the new SVG
        $svg = $svg.attr("id", imgID)  if typeof imgID isnt "undefined"

        # Add replaced image's classes to the new SVG
        $svg = $svg.attr("class", imgClass + " replaced-svg")  if typeof imgClass isnt "undefined"

        # Remove any invalid XML tags as per http://validator.w3.org
        $svg = $svg.removeAttr("xmlns:a")

        # Replace image with new SVG
        $img.replaceWith $svg
        return
      ), "xml"
      return
$(document).ready(swapSvgs)
$(document).on('page:load', swapSvgs)
