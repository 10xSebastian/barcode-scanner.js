global.jQuery = require('jquery')
global.$ = jQuery
global.window = require('jsdom').jsdom().createWindow()
global.document = window.document
require('../../barcode-scanner.js')
require('./helpers/key-event.js')

describe "Barcode Scanner", ->

  it "is defined", ->
    expect(window.BarcodeScanner).toBeDefined()

  it "listen for an input from a barcode scanner", ->
    form = $ "<form></form>"
    input = $ "<input></input>"
    form.html input
    form.on "submit", => console.log "SUBMIT"

    KeyEvent.simulate('Z'.charCodeAt(0), 90);
    KeyEvent.simulate('Z'.charCodeAt(0), 90);
    KeyEvent.simulate(13, 13);