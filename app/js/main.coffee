window.getCanvasX = (userCoordinate, max)->
  (-363.878019848 + 20.3707476 * userCoordinate) * max

window.getCanvasY = (userCoordinate, max)->
  (3637.74 - 61.451484 * userCoordinate) * max

competitors = [
  {points: []}
  {points: []}
]

window.drawCompetitor = (cc, competitor, head) ->
  draw = (cc, point, alpha)-> cc.draw point.longitude, point.latitude, alpha
  drawFlag = (cc, point)-> cc.drawFlag point.longitude, point.latitude

  points = competitor.points
  tail = head - 100
  draw cc, point, (i - tail) / 100 for point, i in points when tail < i < head
  drawFlag cc, points[head] if head < points.length

window.animationFrame = (cc, competitors, millis) ->
  getIndex = (points, millis) -> Math.round(millis / 32) % points.length
  cc.clear()
  drawCompetitor(cc, competitor, getIndex(competitor.points, millis)) for competitor in competitors

window.each = (xml, element, callback) ->
  jQuery(xml).find(element).each callback

window.getGpxHandler = (competitor) ->
  (gpx) ->
    addPoint = ->
      competitor.points.push { latitude: this.attributes['lat'].value, longitude: this.attributes['lon'].value }
    each gpx, 'trkpt', addPoint

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame(cc, competitors, millis)
    requestAnimationFrame executeAnimationFrame

  if document.getElementById 'fg'
    cc = new CanvasContext
    cc.handleResize()
    window.onresize = cc.handleResize
    jQuery.get 'russia.xml', getGpxHandler(competitors[0])
    jQuery.get 'sweden.xml', getGpxHandler(competitors[1])
    requestAnimationFrame executeAnimationFrame

addEventListener 'DOMContentLoaded', init, false