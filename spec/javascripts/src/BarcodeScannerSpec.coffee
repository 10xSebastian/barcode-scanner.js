###

  expectBarcodeScan = (submit, expectedSerializedValue, inputTargetName, expectedInputValue, barcode, hitEnter = true)

###

describe "Barcode Scanner", ->

  it "is defined", ->
    expect(window.BarcodeScanner).toBeDefined()

  it "puts a barcode scanner input to the last barcode-scanner-target", ->
    loadFixtures('multiple-barcode-targets.html')
    expectBarcodeScan true, "first=&second=SPAPE", "second", "SPAPE", "SPAPE"

  it "puts a barcode scanner input to a focused element first", ->
    loadFixtures('multiple-barcode-targets.html')
    $("#jasmine-fixtures form:last input[name='first']").focus()
    expectBarcodeScan true, "first=SPAPE&second=", "first", "SPAPE", "SPAPE"

  it "prevents submit when the specific data attribute is set on the form", ->
    loadFixtures('form-with-prevent-submit.html')
    expectBarcodeScan false, null, "second", "SPAPE", "SPAPE"

  it "prevents submit when the specific data attribute is set on the input", ->
    loadFixtures('input-with-prevent-submit.html')
    expectBarcodeScan false, null, "second", "SPAPE", "SPAPE"