describe "main", ->
  nop = ->

  describe "#init", ->
    it "doesn't crash if there is no canvas", ->
      result = init()
      expect(result).toBeUndefined()

  describe "#animationFrame", ->
    context = null

    beforeEach ->
      context = { clear: nop }

    it "clears screen", ->
      spyOn(context, 'clear')
      animationFrame(context, [])
      expect(context.clear).toHaveBeenCalled()

  describe "#getGpxHandler", ->
    beforeEach ->
      spyOn(window, 'each')

    it "calls each", ->
      getGpxHandler([])('')
      expect(window.each).toHaveBeenCalledWith('', 'trkpt', jasmine.any(Function)) # fake

  describe "#drawCompetitor", ->
    context = null

    beforeEach ->
      context = { draw: nop, drawFlag: nop }

    describe "draws", ->
      points = [
        {longitude: 1, latitude: 54},
        {longitude: 2, latitude: 54},
        {longitude: 3, latitude: 54}
      ]

      beforeEach ->
        spyOn(context, 'draw')
        spyOn(context, 'drawFlag')

      it "the first point", ->
        drawCompetitor(context, points, 0)
        expect(context.drawFlag).toHaveBeenCalledWith(1, 54)

      it "the second point and the first with lower alpha", ->
        drawCompetitor(context, points, 1)
        expect(context.drawFlag).toHaveBeenCalledWith(2, 54)
        expect(context.draw).toHaveBeenCalledWith(1, 54, 0.99)

  describe "#getCanvasX #getCanvasY", ->
    it "maps top left", ->
      expect(getCanvasX(17.862772, 1000)).toBeCloseTo(0, 0)
      expect(getCanvasY(59.196944, 1000)).toBeCloseTo(0, 0)

    it "maps bottom right", ->
      expect(getCanvasX(17.911862, 1000)).toBeCloseTo(1000, 0)
      expect(getCanvasY(59.180671, 1000)).toBeCloseTo(1000, 0)