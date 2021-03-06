fs = require 'fs'
Canvas = require 'canvas'
Image = Canvas.Image

{PSD} = require __dirname + '/../lib/psd.js'

PSD.DEBUG = true

psd = PSD.fromFile __dirname + '/test.psd'
psd.setOptions layerImages: true
psd.parse()

for layer in psd.layers
  continue if layer.isFolder

  do (layer) ->
    layer.image.toFile __dirname + "/output/#{layer.name}.png", ->
      console.log "Layer #{layer.name} output to file."
