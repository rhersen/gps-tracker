window.flagOfSweden = (ctx, size, canvasX, canvasY) ->
  ctx.fillStyle = "rgb(0,82,147)"
  ctx.fillRect(canvasX - size, canvasY - size, size * 2, size * 2)
  ctx.fillStyle = "rgb(254,203,0)"
  ctx.fillRect(canvasX - size * 0.2, canvasY - size, size * 0.4, size * 2)
  ctx.fillRect(canvasX - size, canvasY - size * 0.2, size * 2, size * 0.4)

window.flagOfRussia = (ctx, size, canvasX, canvasY) ->
  ctx.fillStyle = "white"
  ctx.fillRect(canvasX - size, canvasY - size, size * 2, size)
  ctx.fillStyle = "rgb(213,43,30)"
  ctx.fillRect(canvasX - size, canvasY, size * 2, size)
  ctx.fillStyle = "rgb(0,57,166)"
  ctx.fillRect(canvasX - size, canvasY - size / 3, size * 2, size * 2 / 3)