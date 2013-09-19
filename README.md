# barcode-scanner.js 
Javascript library to handle and identify data (keystrokes) entered by a barcode scanner.
![Barcode Scanner](https://raw.github.com/spape/barcode.js/master/img/scanner.png)

## How it works

A barcode scanner works like a keyboard, when you scan a specific barcode, 
the barcode scanner devices types the text version of the barcode like a keyboard, 
but it types so fast (<50ms between keystrokes) that you can identify input
that is done with a barcode scanner and handle it in a special way to sperate it from normal user input.

## input[data-barcode-scanner-target]

```
  
  <form>
    <input data-barcode-scanner-target type='text'></input>
  </form>
  
  1. scan 'IT1232'
  2. insert 'IT1232' to input
  3. submit form

```

A barcode scanner input is pasted to the last input/textarea with an 'data-barcode-scanner-target' attribute found in the dom and submits the closest form.

## input:focus

```
  
  <form>
    <input name='first' type='text'></input>
    <input name='second' data-barcode-scanner-target type='text'></input>
  </form>
  
  $("input:first").focus()
  
  1. scan 'IT1232'
  2. insert 'IT1232' to input with name "first"
  3. submit form

```

If an input or textarea is focused the barcode scanner input is always inserted to the focused input/textarea and the surrounding form is submitted.

## *[data-prevent-barcode-scanner-submit]

```
  
  <form data-prevent-barcode-scanner-submit>
    <input data-barcode-scanner-target type='text'></input>
  </form>
  
  or 
  
  <form>
    <input data-barcode-scanner-target data-prevent-barcode-scanner-submit type='text'></input>
  </form>
  
  1. scan 'IT1232'
  2. insert 'IT1232' to input
  3. form is NOT getting submitted

```
