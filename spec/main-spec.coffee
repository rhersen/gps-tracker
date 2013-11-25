describe "main", ->
  nop = ->

  describe "#init", ->
    it "doesn't crash if there is no canvas", ->
      result = init()
      expect(result).toBeUndefined()

  describe "#animationFrame", ->
    context = { clear: nop }

    beforeEach ->
      spyOn(context, 'clear')

    it "clears screen", ->
      animationFrame(context, [])
      expect(context.clear).toHaveBeenCalled()

  describe "#getGpxHandler", ->
    beforeEach ->
      spyOn(window, 'each')

    it "calls each", ->
      getGpxHandler([])('')
      expect(window.each).toHaveBeenCalledWith('', 'trkpt', jasmine.any(Function)) # fake

  describe "#drawCompetitor", ->
    context = { draw: nop, drawFlag: nop }

    competitor = {
      points: [
        {longitude: 1, latitude: 54},
        {longitude: 2, latitude: 54},
        {longitude: 3, latitude: 54}
      ]
    }
    beforeEach ->
      spyOn(context, 'draw')
      spyOn(context, 'drawFlag')

    it "draws the first point", ->
      drawCompetitor(context, competitor, 0)
      expect(context.drawFlag).toHaveBeenCalledWith(1, 54)

    it "draws flag and point", ->
      drawCompetitor(context, competitor, 1)
      expect(context.drawFlag).toHaveBeenCalledWith(2, 54)
      expect(context.draw).toHaveBeenCalledWith(1, 54, 0.99)

  describe "#getCanvasX #getCanvasY", ->
    it "maps top left", ->
      expect(getCanvasX(17.862772, 1000)).toBeCloseTo(0, 0)
      expect(getCanvasY(59.196944, 1000)).toBeCloseTo(0, 0)

    it "maps bottom right", ->
      expect(getCanvasX(17.911862, 1000)).toBeCloseTo(1000, 0)
      expect(getCanvasY(59.180671, 1000)).toBeCloseTo(1000, 0)