class window.CanvasContext
  constructor: ->
    @canvas = document.getElementById 'fg'
    @ctx = @canvas.getContext '2d'

  draw: (x, y, alpha) ->
    alpha = alpha || 1.0
    @ctx.beginPath()
    @ctx.arc(
      getCanvasX(x, @canvas.width),
      getCanvasY(y, @canvas.height),
      4, 0, 2 * Math.PI, false
    )
    @ctx.fillStyle = "rgba(0,82,147,#{ alpha })"
    @ctx.fill()

  drawFlag: (x, y) ->
    size = 2
    canvasX = getCanvasX(x, @canvas.width)
    canvasY = getCanvasY(y, @canvas.height)
    @ctx.fillStyle = "rgb(0,82,147)"
    @ctx.fillRect(canvasX - size * 5, canvasY - size * 5, size * 10, size * 10)
    @ctx.fillStyle = "rgb(254,203,0)"
    @ctx.fillRect(canvasX - size, canvasY - size * 5, size * 2, size * 10)
    @ctx.fillRect(canvasX - size * 5, canvasY - size, size * 10, size * 2)

  clear: ->
    @ctx.clearRect(0, 0, @canvas.width, @canvas.height)

  handleResize: ->
    margin = 1
    px = margin + "px"
    @canvas = document.getElementById 'fg'
    @canvas.style.marginLeft = px
    @canvas.style.marginTop = px
    @canvas.width = window.innerWidth - (margin * 2)
    @canvas.height = window.innerHeight - (margin * 2)
