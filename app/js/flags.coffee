cross = (width, color, ctx, size, x, y) ->
  ctx.fillStyle = color
  ctx.fillRect x - size * width, y - size, size * 2 * width, size * 2
  ctx.fillRect x - size, y - size * width, size * 2, size * 2 * width

bg = (color, ctx, size, x, y) ->
  ctx.fillStyle = color
  ctx.fillRect x - size, y - size, size * 2, size * 2

window.flags =
  russia:
    (ctx, size, x, y) ->
      bg "white", ctx, size, x, y
      ctx.fillStyle = "rgb(213,43,30)"
      ctx.fillRect x - size, y, size * 2, size
      ctx.fillStyle = "rgb(0,57,166)"
      ctx.fillRect x - size, y - size / 3, size * 2, size * 2 / 3

  sweden:
    (ctx, size, x, y) ->
      bg "rgb(0,82,147)", ctx, size, x, y
      cross 0.2, "rgb(254,203,0)", ctx, size, x, y

  italy:
    (ctx, size, x, y) ->
      bg "rgb(0,146,70)", ctx, size, x, y
      ctx.fillStyle = "rgb(206,43,55)"
      ctx.fillRect x, y - size, size, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size / 3, y - size, size * 2 / 3, size * 2

  finland:
    (ctx, size, x, y) ->
      bg "white", ctx, size, x, y
      cross 0.2, "rgb(0,82,147)", ctx, size, x, y

  france:
    (ctx, size, x, y) ->
      bg "rgb(0,35,149)", ctx, size, x, y
      ctx.fillStyle = "rgb(206,43,55)"
      ctx.fillRect x, y - size, size, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size / 3, y - size, size * 2 / 3, size * 2

  norway:
    (ctx, size, x, y) ->
      bg "rgb(239,43,45)", ctx, size, x, y
      cross 1 / 4, "white", ctx, size, x, y
      cross 1 / 8, "rgb(0,40,104)", ctx, size, x, y

  switzerland:
    (ctx, size, x, y) ->
      bg "rgb(213,43,30)", ctx, size, x, y
      ctx.fillStyle = "white"
      ctx.fillRect x - size * 0.2, y - size * 0.8, size * 0.4, size * 1.6
      ctx.fillRect x - size * 0.8, y - size * 0.2, size * 1.6, size * 0.4

  usa:
    (ctx, size, x, y) ->
      bg "rgb(178,34,52)", ctx, size, x, y
      ctx.fillStyle = "white"
      ctx.fillRect x - size, y - size * 0.6, size * 2, size * 0.4
      ctx.fillRect x - size, y + size * 0.2, size * 2, size * 0.4
      ctx.fillStyle = "rgb(60,59,110)"
      ctx.fillRect x - size, y - size, size, size
