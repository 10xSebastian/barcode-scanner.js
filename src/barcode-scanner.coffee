###

  BarcodeScanner
  
###

jQuery -> $(window).keypress window.BarcodeScanner.onKeyPress

class window.BarcodeScanner
  
  @delay = 50
  @timer = null
  @input = null
  @knownPrefixes = []
  
  @onKeyPress: =>
      e = e || window.event
      char_code = if (typeof e.which == "number") then e.which else e.keyCode  
      _char = String.fromCharCode(char_code)
      if (char_code == 13) and (BarcodeScanner.input != "")
        e.preventDefault()
        BarcodeScanner.execute()
        BarcodeScanner.input = null
      else
        BarcodeScanner.input += _char
        window.clearTimeout BarcodeScanner.timer  
        BarcodeScanner.timer = window.setTimeout ()-> 
          BarcodeScanner.input = null
        , BarcodeScanner.delay

  @execute: ->
    target = if $("input:focus, textarea:focus").length then $("*:focus:first") else $("[data-barcode-scanner-target]:last")
    prefix = BarcodeScanner.input.match(/^\s\w\s/).join().replace(/\s/g, "") if BarcodeScanner.input.match(/^\s\w\s/)?
    code = BarcodeScanner.input.replace(/^\s\w\s/, "")
    if target.is(":not(:focus)") and @knownPrefixes[prefix]? and (typeof(@knownPrefixes[prefix]) == "function")
      @knownPrefixes[prefix].call @, code
      return true
    target.val("").val code
    @submit target

  @submit: (target)=>
    unless target.closest("[data-barcode-scanner-submit]").length or target.data("prevent-barcode-scanner-submit")?
      $(target).closest("form").submit()