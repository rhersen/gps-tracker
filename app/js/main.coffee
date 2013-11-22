window.getCanvasX = (userCoordinate, max)->
  (-363.878019848 + 20.3707476 * userCoordinate) * max

window.getCanvasY = (userCoordinate, max)->
  (3637.74 - 61.451484 * userCoordinate) * max

points = []

window.animationFrame = (cc, points, millis) ->
  cc.clear()
  point = points[Math.round(millis / 8) % points.length]
  if point
    cc.draw point.longitude, point.latitude

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame(cc, points, millis)
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