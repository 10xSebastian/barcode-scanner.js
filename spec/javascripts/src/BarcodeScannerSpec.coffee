describe "Barcode Scanner", ->

  it "is defined", ->
    expect(window.BarcodeScanner).toBeDefined()

  it "puts a barcode scanner input to the last barcode-scanner-target", ->
    form = $ "<form action='#'></form>"
    form.append $ "<input data-barcode-scanner-target='' name='first'></input>"
    form.append $ "<input data-barcode-scanner-target='' name='second'></input>"
    $("body").html form
    expectSubmit form, "first=&second=SPAPE", "second", "SPAPE", "SPAPE"

  it "puts a barcode scanner input to a focused element first", ->
    form = $ "<form action='#'></form>"
    form.append $ "<input data-barcode-scanner-target='' name='first'></input>"
    form.append $ "<input data-barcode-scanner-target='' name='second'></input>"
    $("body").html form
    form.find("input[name='first']").focus()
    expectSubmit form, "first=SPAPE&second=", "first", "SPAPE", "SPAPE"