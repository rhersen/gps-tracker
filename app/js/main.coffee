window.getCanvasCoordinate = (x, width)->
  width / 2 + (width / 2 - 10) * x

window.animationFrame = (cc, millis) ->
  cc.clear()
  cc.draw Math.sin(millis / 4000), Math.sin(millis / 5000)

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