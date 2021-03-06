class window.CanvasContext
  constructor: ->
    @canvas = document.getElementById 'fg'
    @ctx = @canvas.getContext '2d'

  draw: (x, y, r, g, b, alpha) ->
    alpha = alpha || 1.0
    @ctx.beginPath()
    @ctx.arc (getCanvasX x, @canvas.width), (getCanvasY y, @canvas.height), 4, 0, 2 * Math.PI, false
    @ctx.fillStyle = "rgba(#{ r },#{ g },#{ b },#{ alpha })"
    @ctx.fill()

  shadow: (size, x, y) ->
    @ctx.fillStyle = "white"
    @ctx.fillRect x - size, y - size, size * 2, size * 2

  drawFlag: (name, x, y) ->
    size = 12
    @shadow(size + 1, (getCanvasX x, @canvas.width), (getCanvasY y, @canvas.height))
    flags[name](@ctx, size, (getCanvasX x, @canvas.width), (getCanvasY y, @canvas.height))

  clear: ->
    @ctx.clearRect 0, 0, @canvas.width, @canvas.height

  handleResize: ->
    margin = 1
    px = margin + "px"
    @canvas = document.getElementById 'fg'
    @canvas.style.marginLeft = px
    @canvas.style.marginTop = px
    @canvas.width = window.innerWidth - margin * 2
    @canvas.height = window.innerHeight - margin * 2
