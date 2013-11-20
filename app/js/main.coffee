window.getCanvasCoordinate = (userCoordinate, max)->
  max / 2 + (max / 2 - 10) * userCoordinate

window.animationFrame = (cc, millis) ->
  cc.clear()
  cc.draw Math.sin(millis / 2800), Math.sin(millis / 2000)

window.init = ->
  executeAnimationFrame = (millis) ->
    animationFrame(cc, millis)
    requestAnimationFrame executeAnimationFrame
  if document.getElementById 'fg'
    cc = new CanvasContext
    cc.handleResize()
    window.onresize = cc.handleResize
    cc.draw 0, 0
    requestAnimationFrame executeAnimationFrame

addEventListener('DOMContentLoaded', init, false)