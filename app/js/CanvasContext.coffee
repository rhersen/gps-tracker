class window.CanvasContext
  constructor: ->
    @canvas = document.getElementById 'fg'
    @ctx = @canvas.getContext '2d'

  draw: (x, y) ->
    @ctx.beginPath()
    @ctx.arc(
      getCanvasX(x, @canvas.width),
      getCanvasY(y, @canvas.height),
      4, 0, 2 * Math.PI, false
    )
    @ctx.fillStyle = "rgba(255,0,255,0.7)"
    @ctx.fill()

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
