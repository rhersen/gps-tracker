window.getCanvasX = (userCoordinate, max)->
  (-363.878019848 + 20.3707476 * userCoordinate) * max

window.getCanvasY = (userCoordinate, max)->
  (3637.74 - 61.451484 * userCoordinate) * max

window.animationFrame = (cc, millis) ->
  cc.clear()
  cc.draw 17.901875, 59.1931
  cc.draw 17.901592, 59.192834
  cc.draw 17.895976, 59.187787
  cc.draw 17.886151, 59.183288
  cc.draw 17.874124, 59.185354
  cc.draw 17.879905, 59.190334
  cc.draw 17.88877, 59.187458
  cc.draw 17.897629, 59.189351
  cc.draw 17.901763, 59.193056

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