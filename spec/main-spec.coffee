describe "main", ->
  nop = ->

  competitor = {
    name: 'monaco',
    color: {red: 213, green: 43, blue: 30},
    points: [
      {longitude: 1, latitude: 54},
      {longitude: 2, latitude: 54},
      {longitude: 3, latitude: 54}
    ]
  }

  context = { clear: nop, draw: nop, drawFlag: nop }

  describe "#init", ->
    it "doesn't crash if there is no canvas", ->
      result = init()
      (expect result).toBeUndefined()

  describe "#animationFrame", ->
    beforeEach ->
      spyOn context, 'clear'

    it "clears screen", ->
      animationFrame context, []
      (expect context.clear).toHaveBeenCalled()

    describe "#getGpxHandler", ->
      beforeEach ->
        spyOn window, 'each'

      it "calls each", ->
        (getGpxHandler {points: []}) ''
        (expect window.each).toHaveBeenCalledWith('', 'trkpt', (jasmine.any Function))

  describe "#drawHead", ->
    beforeEach ->
      spyOn context, 'draw'
      spyOn context, 'drawFlag'

    it "draws the first point", ->
      drawHead context, competitor, 0
      (expect context.drawFlag).toHaveBeenCalledWith 'monaco', 1, 54

    it "draws flag and point", ->
      drawHead context, competitor, 1
      (expect context.drawFlag).toHaveBeenCalledWith 'monaco', 2, 54

  describe "#drawTail", ->
    beforeEach ->
      spyOn context, 'draw'
      spyOn context, 'drawFlag'

    it "draws flag and point", ->
      drawTail context, competitor, 1
      (expect context.draw).toHaveBeenCalledWith 1, 54, 213, 43, 30, 0.99

  describe "#getCanvasX #getCanvasY", ->
    it "maps top left", ->
      (expect getCanvasX 17.862772, 1000).toBeCloseTo 0, 0
      (expect getCanvasY 59.196944, 1000).toBeCloseTo 0, 0

    it "maps bottom right", ->
      (expect getCanvasX 17.911862, 1000).toBeCloseTo 1000, 0
      (expect getCanvasY 59.180671, 1000).toBeCloseTo 1000, 0

  describe "#getGpx", ->
    it "gets gpx data for supplied points", ->
      (expect getGpx [ {lat: 59.180671, lon: 17.911862}, {lat: 59.196944, lon: 17.862772} ]).toBe '&lt;trk>\n&lt;trkpt lat="59.180671" lon="17.911862">&lt;/trkpt>\n&lt;trkpt lat="59.196944" lon="17.862772">&lt;/trkpt>\n&lt;/trk>'