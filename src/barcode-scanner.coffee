###

  BarcodeScanner

  TODO:
   - configuration for when to submit
   - configuration for submit when delay ends
  
    BarcodeScanner.addPrefix "C", (text)=>
    alert(text);

    Regexp 

    BarcodeScanner "c(:term)", (term) =>
      lkajsdfkljasdf

    BarcodeScanner "*", (text) =>
      closest().val(text).closest(form).submit()

    BarcodeScanner "*", 50, (text)=> 

    BarcodeScanner regexp, delay, function
  
###

jQuery -> $(window).keypress window.BarcodeScanner.onKeyPress

class window.BarcodeScanner

  @delay = 50
  @timer = null
  @buffer = null
  @knownPrefixes = []
  
  @execute: ->
    target = if $("*:focus:first").length then $("*:focus:first") else $("[data-barcode-scanner-target]:last")
    prefix = BarcodeScanner.findPrefix target
    code = BarcodeScanner.buffer.replace(/^\s\w\s/, "")
    if target.is(":not(:focus)") and @knownPrefixes[prefix]? and (typeof(@knownPrefixes[prefix]) == "function")
      @knownPrefixes[prefix].call @, code
      return true
    target.val("").val code
    @submit target

  @findPrefix: ->
    BarcodeScanner.buffer.match(/^\s\w\s/).join().replace(/\s/g, "") if BarcodeScanner.buffer.match(/^\s\w\s/)?

  @onKeyPress: (e = window.event)=>
    charCode = if (typeof e.which == "number") then e.which else e.keyCode  
    char = String.fromCharCode(charCode)
    console.log charCode == 13
    if (charCode == 13) and BarcodeScanner.buffer?
      e.preventDefault()
      BarcodeScanner.execute()
      BarcodeScanner.buffer = null
    else
      BarcodeScanner.buffer ?= ""
      BarcodeScanner.buffer += _char
      window.clearTimeout BarcodeScanner.timer  
      BarcodeScanner.timer = window.setTimeout ()-> 
        BarcodeScanner.buffer = null
      , BarcodeScanner.delay

  @submit: (target)=>
    unless target.closest("[data-prevent-barcode-scanner-submit]").length or target.data("prevent-barcode-scanner-submit")?
      $(target).closest("form").submit()