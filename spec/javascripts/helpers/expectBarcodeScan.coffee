window.expectBarcodeScan = (submit, expectedSerializedValue, inputTargetName, expectedInputValue, barcode, hitEnter = true)->

  form = $("#jasmine-fixtures form:last")

  form.on "submit", -> 
    unless submit
      expect(true).toBe(false, "this barcode scan should not submit")

  for character in barcode.split("")
    KeyEvent.simulate character.charCodeAt(0)
    
  KeyEvent.simulate(13, 13) if hitEnter

  expect(form.find("input[name='#{inputTargetName}']").val()).toBe expectedInputValue
  expect(form.serialize()).toBe expectedSerializedValue if expectedSerializedValue?

  form.off "submit"