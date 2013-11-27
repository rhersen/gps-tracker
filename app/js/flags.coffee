window.flags =
  russia:
    (ctx, size, x, y) ->
      ctx.fillStyle = "white"
      ctx.fillRect x - size, y - size, size * 2, size
      ctx.fillStyle = "rgb(213,43,30)"
      ctx.fillRect x - size, y, size * 2, size
      ctx.fillStyle = "rgb(0,57,166)"
      ctx.fillRect x - size, y - size / 3, size * 2, size * 2 / 3

  sweden:
    (ctx, size, x, y) ->
      ctx.fillStyle = "rgb(0,82,147)"
      ctx.fillRect x - size, y - size, size * 2, size * 2
      ctx.fillStyle = "rgb(254,203,0)"
      ctx.fillRect x - size * 0.2, y - size, size * 0.4, size * 2
      ctx.fillRect x - size, y - size * 0.2, size * 2, size * 0.4

  italy:
    (ctx, size, x, y) ->
      ctx.fillStyle = "rgb(0,146,70)"
      ctx.fillRect x - size, y - size, size, size * 2
      ctx.fillStyle = "rgb(206,43,55)"
      ctx.fillRect x, y - size, size, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size / 3, y - size, size * 2 / 3, size * 2

  finland:
    (ctx, size, x, y) ->
      ctx.fillStyle = "white"
      ctx.fillRect x - size, y - size, size * 2, size * 2
      ctx.fillStyle = "rgb(0,82,147)"
      ctx.fillRect x - size * 0.2, y - size, size * 0.4, size * 2
      ctx.fillRect x - size, y - size * 0.2, size * 2, size * 0.4

  france:
    (ctx, size, x, y) ->
      ctx.fillStyle = "rgb(0,0,255)"
      ctx.fillRect x - size, y - size, size, size * 2
      ctx.fillStyle = "rgb(206,43,55)"
      ctx.fillRect x, y - size, size, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size / 3, y - size, size * 2 / 3, size * 2

  norway:
    (ctx, size, x, y) ->
      ctx.fillStyle = "red"
      ctx.fillRect x - size, y - size, size * 2, size * 2
      ctx.fillStyle = "rgb(0,82,147)"
      ctx.fillRect x - size * 0.2, y - size, size * 0.4, size * 2
      ctx.fillRect x - size, y - size * 0.2, size * 2, size * 0.4

  switzerland:
    (ctx, size, x, y) ->
      ctx.fillStyle = "red"
      ctx.fillRect x - size, y - size, size * 2, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size * 0.2, y - size, size * 0.4, size * 2
      ctx.fillRect x - size, y - size * 0.2, size * 2, size * 0.4

  usa:
    (ctx, size, x, y) ->
      ctx.fillStyle = "red"
      ctx.fillRect x - size, y - size, size * 2, size * 2
      ctx.fillStyle = "white"
      ctx.fillRect x - size, y - size * 0.6, size * 2, size * 0.4
      ctx.fillRect x - size, y + size * 0.2, size * 2, size * 0.4
