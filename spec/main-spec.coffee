describe "main", ->
  describe "#init", ->
    it "doesn't crash if there is no canvas", ->
      result = init()
      expect(result).toBeUndefined()

  describe "#animationFrame", ->
    context = null

    beforeEach ->
      nop = ->
      context = { clear: nop, draw: nop }

    it "clears screen", ->
      spyOn(context, 'clear')
      animationFrame(context)
      expect(context.clear).toHaveBeenCalled()

    it "draws", ->
      spyOn(context, 'draw')
      animationFrame(context)
      expect(context.draw).toHaveBeenCalled()

  describe "#getCanvasCoordinate", ->
    it "maps zero to middle", ->
      result = getCanvasCoordinate(0, 100)
      expect(result).toBe(50)

    it "maps minus one to margin", ->
      result = getCanvasCoordinate(-1, 100)
      expect(result).toBe(10)