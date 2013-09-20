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

  it "performs a simple registered action", ->
    functionCalls = []
    loadFixtures('multiple-barcode-targets.html')
    BarcodeScanner.addAction "c (id)", (id)->
      functionCalls.push id
    expectBarcodeScan false, null, null, null, "c 512"
    expect(functionCalls).toMatch(['512'])

  it "performs a more complex registered action", ->
    functionCalls = []
    loadFixtures('multiple-barcode-targets.html')
    BarcodeScanner.addAction "c (id) (user) (name)", (id, user, name)->
      functionCalls.push 
        id: id
        user: user
        name: name
    expectBarcodeScan false, null, null, null, "c 512 SPAPE Sebastian"
    expect(functionCalls).toMatch({id: '512', user: 'SPAPE', name: 'Sebastian'})