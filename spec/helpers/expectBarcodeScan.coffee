window.expectBarcodeScan = (submit, expectedSerializedValue, inputTargetName, expectedInputValue, barcode, hitEnter = true)->

  form = $("form:last")

  form.on "submit", (e)->
    e.preventDefault()
    expect($("input:focus").length).toBe(1)
    unless submit
      expect(true).toBe(false, "this barcode scan should not submit")
    return false

  for character in barcode.split("")
    KeyEvent.simulate character.charCodeAt(0)
    
  KeyEvent.simulate(13, 13) if hitEnter

  if inputTargetName?
    expect(form.find("input[name='#{inputTargetName}']").val()).toBe expectedInputValue
  else
    for input in form.find("input")
      expect($(input).val().length).toBe 0

  expect(form.serialize()).toBe expectedSerializedValue if expectedSerializedValue?

  form.off "submit"

  $("*:focus").blur()