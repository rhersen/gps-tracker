kx = 20.3707476
mx = -363.878019848
ky = -61.451484
my = 3637.74
anim = null
delay = 100
currentFrame = 0
timeToNextFrame = delay

window.getCanvasX = (userCoordinate, max)->
  (kx * userCoordinate + mx) * max

window.getCanvasY = (userCoordinate, max)->
  (ky * userCoordinate + my) * max

competitors = [
  {name: 'finland', color: {red: 0, green: 82, blue: 147}, points: []}
  {name: 'germany', color: {red: 0, green: 0, blue: 0}, points: []}
  {name: 'sweden', color: {red: 254, green: 203, blue: 0}, points: []}
  {name: 'france', color: {red: 0, green: 35, blue: 149}, points: []}
  {name: 'switzerland', color: {red: 213, green: 43, blue: 30}, points: []}
  {name: 'usa', color: {red: 60, green: 59, blue: 110}, points: []}
  {name: 'italy', color: {red: 0, green: 146, blue: 70}, points: []}
  {name: 'russia', color: {red: 213, green: 43, blue: 30}, points: []}
  {name: 'norway', color: {red: 239, green: 43, blue: 45}, points: []}
]

window.drawHead = (cc, competitor, head) ->
  drawFlag = (point) -> cc.drawFlag competitor.name, point.longitude, point.latitude

  points = competitor.points
  drawFlag points[head] if head < points.length

window.drawTail = (cc, competitor, head) ->
  draw = (point, alpha) -> cc.draw point.longitude, point.latitude, competitor.color.red, competitor.color.green, competitor.color.blue, alpha

  points = competitor.points
  tail = head - 100
  draw point, (i - tail) / 400 for point, i in points when tail < i < head

window.animationFrame = (cc, competitors, millis) ->
  getIndex = (points) ->
    timeToNextFrame -= 1
    if timeToNextFrame <= 0
      currentFrame += 1
      timeToNextFrame = delay
    if points.length == 0 then 0 else if currentFrame < points.length then currentFrame else points.length - 1
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

quote = (s) ->
  '"' + s + '"'

window.getGpx = (points) ->
  trkpts = ("&lt;trkpt lat=#{ (quote point.lat) } lon=#{ (quote point.lon) }>&lt;/trkpt>" for point in points)
  return ["&lt;trk>", (trkpts.join '\n'), "&lt;/trk>"].join '\n'

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame cc, competitors, millis
    anim = requestAnimationFrame executeAnimationFrame

  if document.getElementById 'fg'
    cc = new CanvasContext
    cc.handleResize()
    window.onresize = cc.handleResize
    jQuery.get competitor.name + '.xml', getGpxHandler competitor.points for competitor in competitors
    enableRecording kx, mx, ky, my
    anim = requestAnimationFrame executeAnimationFrame
    (jQuery 'body').keydown (e) ->
      if e.keyCode == 32
        if anim
          cancelAnimationFrame(anim)
          anim = null
        else
          anim = requestAnimationFrame executeAnimationFrame
      else if e.keyCode == 38
        delay *= 0.9
      else if e.keyCode == 40
        delay *= 1.1

addEventListener 'DOMContentLoaded', init, false