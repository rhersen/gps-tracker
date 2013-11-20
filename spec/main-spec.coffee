describe "main", ->
  describe "#animationFrame", ->
    context = null

    beforeEach ->
      nop = ->
      context = { clear: nop, draw: nop }

    it "draws", ->
      spyOn(context, 'draw')
      animationFrame(context)
      expect(context.draw).toHaveBeenCalled()

    it "clears screen", ->
      spyOn(context, 'clear')
      animationFrame(context)
      expect(context.clear).toHaveBeenCalled()

  describe "#init", ->
    it "doesn't crash if there is no canvas", ->
      result = init()
      expect(result).toBeUndefined()