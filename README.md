# barcode-scanner.js
Javascript library to handle and identify data (keystrokes) entered by a barcode scanner.
![Barcode Scanner](https://raw.github.com/spape/barcode.js/master/img/scanner.png)

## FAQ

- [My scanner is not pulling something from the barcode with this library](https://github.com/pape-io/barcode-scanner.js/issues/5)
- [I have to do multiple different scans on the same page](https://github.com/pape-io/barcode-scanner.js/issues/6)
- [Which characters can be scanned, and which libs are supported?](https://github.com/pape-io/barcode-scanner.js/issues/7)

## How it works

A barcode scanner works like a keyboard, when you scan a specific barcode, 
the barcode scanner device types the text version of the barcode like a keyboard, 
but it types so fast (<50ms between keystrokes) that you can identify input
that is done with a barcode scanner and handle it in a special way.

## Default usage

A barcode scanner input is pasted to the last input/textarea with an 'data-barcode-scanner-target' attribute found in the dom and submits the closest form.

```
  <form>
    <input data-barcode-scanner-target type='text'></input>
  </form>
```

- If scanner scans 'IT1232'
- barcode-scanner.js inserts 'IT1232' into the input field
- Afterwards it submits the surrounding form

## Behaviour when user focuses an input field

If an input or textarea is focused (clicked) by the user, the barcode scanner input is always inserted to the focused input/textarea and the surrounding form is submitted.

```
  <form>
    <input name='first' type='text'></input>
    <input name='second' data-barcode-scanner-target type='text'></input>
  </form>
```

- User focuses (clicks) the input with the name 'first'
- Scanner scans 'IT1232'
- barcode-scanner.js inserts 'IT1232' to the input with name "first" (as its focused)
- Afterwards it submits the surrounding form

## Disable auto submit

The auto submit of the surrounding form can be disabled.

```
  <form data-prevent-barcode-scanner-submit>
    <input data-barcode-scanner-target type='text'></input>
  </form>
```

  or 

```
  <form>
    <input data-barcode-scanner-target data-prevent-barcode-scanner-submit type='text'></input>
  </form>
```

- If scanner scans 'IT1232'
- barcode-scanner.js inserts 'IT1232' into the input field
- Afterwards it does NOT submit the surrounding form, as it's disabled

## Custom actions / More complex scenarios

In case you have more complex requirements, like multiple input fields where something has to decide in which input field the code has to be entered, custom actions is what you can use to solve it.

```
  BarcodeScanner.addAction("c (id)", function(id) {
    console.log(this); // the current input/textarea that is the barcode target
    console.log(id);  // 2121232
  });
```

- If scanner scans 'c 2121232'
- The registered action will be performed (as it matches the registered pattern)
- No form is getting submitted, no chars will be added to any input field

## Structured Barcodes / Custom actions

If your barcode contains structured information, like which type of item is it etc., it's recommended to structure you barcode.
This would allow this library to identify each part of the barcode. 
Like 'c 123 buy 5' where 'c' stands for custom action, '123' is the id of the item, buy the action you want to perform and '5' the amount.

```
  BarcodeScanner.addAction("c (id) (action) (amount)", function(id, action, amount) {
    console.log(this);    // the current input/textarea that is the barcode target
    console.log(id);      // 2121232
    console.log(action);  // print
    console.log(amount);  // 2
  });
```

- If scanner scans "c 2121232 print 2"
- The registered action will be performed (as it matches the registered pattern)
- No form is getting submitted, no chars will be added to any input field

## Tests

[Jasmine Tests](https://rawgithub.com/spape/barcode-scanner.js/master/SpecRunner.html)
