window.inputWithPreventSubmit = $("\
<form>\
  <input data-barcode-scanner-target='' name='first' type='text'></input>\
  <input data-prevent-barcode-scanner-submit data-barcode-scanner-target='' name='second' type='text'></input>\
</form>");