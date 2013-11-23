window.getCanvasX = (userCoordinate, max)->
  (-363.878019848 + 20.3707476 * userCoordinate) * max

window.getCanvasY = (userCoordinate, max)->
  (3637.74 - 61.451484 * userCoordinate) * max

points = []

getIndex = (millis) ->
  Math.round(millis / 32) % points.length

draw = (cc, point, alpha)->
  cc.draw point.longitude, point.latitude, alpha

window.animationFrame = (cc, points, head) ->
  cc.clear()
  tail = head - 100
  draw cc, point, (i - tail) / 100 for point, i in points when tail < i <= head

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame(cc, points, getIndex(millis))
    requestAnimationFrame executeAnimationFrame

  handleGpx = (gpx) ->
    addPoint = ->
      trkpt = jQuery(this)
      points.push({
        latitude: trkpt.attr('lat')
        longitude: trkpt.attr('lon')
      })

    jQuery(gpx).find('trkpt').each addPoint

  if document.getElementById 'fg'
    cc = new CanvasContext
    cc.handleResize()
    window.onresize = cc.handleResize
    jQuery.get 'gpx.xml', handleGpx
    requestAnimationFrame executeAnimationFrame

addEventListener('DOMContentLoaded', init, false)