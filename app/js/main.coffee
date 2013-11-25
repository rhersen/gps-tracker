window.getCanvasX = (userCoordinate, max)->
  (-363.878019848 + 20.3707476 * userCoordinate) * max

window.getCanvasY = (userCoordinate, max)->
  (3637.74 - 61.451484 * userCoordinate) * max

competitors = [
  {name: 'sweden', color: {red: 0, green: 82, blue: 147}, points: []}
  {name: 'russia', color: {red: 213, green: 43, blue: 30}, points: []}
]

window.drawHead = (cc, competitor, head) ->
  drawFlag = (point) -> cc.drawFlag competitor.name, point.longitude, point.latitude

  points = competitor.points
  drawFlag points[head] if head < points.length

window.drawTail = (cc, competitor, head) ->
  draw = (point, alpha) -> cc.draw point.longitude, point.latitude, competitor.color.red, competitor.color.green, competitor.color.blue, alpha

  points = competitor.points
  tail = head - 100
  draw point, (i - tail) / 100 for point, i in points when tail < i < head

window.animationFrame = (cc, competitors, millis) ->
  getIndex = (points, millis) -> (Math.round millis / 32) % points.length
  cc.clear()
  drawTail cc, competitor, (getIndex competitor.points, millis) for competitor in competitors
  drawHead cc, competitor, (getIndex competitor.points, millis) for competitor in competitors

window.each = (xml, element, callback) ->
  ((jQuery xml).find element).each callback

window.getGpxHandler = (points) ->
  (gpx) ->
    addPoint = ->
      points.push { latitude: this.attributes['lat'].value, longitude: this.attributes['lon'].value }
    each gpx, 'trkpt', addPoint

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame cc, competitors, millis
    requestAnimationFrame executeAnimationFrame

  if document.getElementById 'fg'
    cc = new CanvasContext
    cc.handleResize()
    window.onresize = cc.handleResize
    jQuery.get competitors[0].name + '.xml', getGpxHandler competitors[0].points
    jQuery.get competitors[1].name + '.xml', getGpxHandler competitors[1].points
    requestAnimationFrame executeAnimationFrame

addEventListener 'DOMContentLoaded', init, false