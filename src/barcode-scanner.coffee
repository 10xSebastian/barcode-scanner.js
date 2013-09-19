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

class BarcodeScanner

  actions = []
  buffer = null
  delay = 50
  timer = null
  
  addChar: (char)=>
    @buffer ?= ""
    @buffer += char
    window.clearTimeout @timer
    @timer = window.setTimeout (-> @buffer = null), @delay

  execute: =>
    console.log "============="
    console.log $("input:focus, textarea:focus").length
    console.log "============="
    target = if $("input:focus, textarea:focus").length then $("input:focus, textearea:focus") else $("[data-barcode-scanner-target]:last")
    code = do @getCode
    # prefix = BarcodeScanner.findPrefix target
    # code = BarcodeScanner.buffer.replace(/^\s\w\s/, "")
    # if target.is(":not(:focus)") and @knownPrefixes[prefix]? and (typeof(@knownPrefixes[prefix]) == "function")
    #   #@knownPrefixes[prefix].call @, code
    #   return true
    if knownAction?
    else
      target.val("").val code
      @submit target
    @buffer = null

  getCode: => @buffer.replace(/^\s\w\s/, "")

  # findPrefix: -> @buffer.match(/^\s\w\s/).join().replace(/\s/g, "") if @buffer.match(/^\s\w\s/)?

  keyPress: (e = window.event)=>
    charCode = if (typeof e.which == "number") then e.which else e.keyCode
    char = String.fromCharCode(charCode)
    if (charCode == 13) and @buffer?
      do e.preventDefault
      do @execute
    else
      @addChar char

  submit: (target)=>
    if not target.closest("[data-prevent-barcode-scanner-target]").length
      target.closest("form").submit()

window.BarcodeScanner = new BarcodeScanner()

$(window).keypress window.BarcodeScanner.keyPress