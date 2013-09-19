// window.expectSubmit = (form, expectedSerializedValue, inputTargetName, expectedInputValue, barcode, hitEnter = true)->

//   form.on "submit", -> 
//     expect(form.find("input[name='#{inputTargetName}']").val()).toBe expectedInputValue
//     expect(form.serialize()).toBe expectedSerializedValue

//   for character in barcode.split("")
//     KeyEvent.simulate character.charCodeAt(0)
    
//   KeyEvent.simulate(13, 13) if hitEnter

(function() {

  window.expectSubmit = function(form, expectedSerializedValue, inputTargetName, expectedInputValue, barcode, hitEnter) {
    var character, _i, _len, _ref;
    if (hitEnter == null) {
      hitEnter = true;
    }
    form.on("submit", function() {
      expect(form.find("input[name='" + inputTargetName + "']").val()).toBe(expectedInputValue);
      return expect(form.serialize()).toBe(expectedSerializedValue);
    });
    _ref = barcode.split("");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      character = _ref[_i];
      KeyEvent.simulate(character.charCodeAt(0));
    }
    if (hitEnter) {
      return KeyEvent.simulate(13, 13);
    }
  };

}).call(this);