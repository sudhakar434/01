jQuery
======


Disable button
--------------

    $("input[value='vcf']").click(writeData);
    function writeData() {
         jQuery("input[value=vcf]").attr('disabled',true);
    }

    // disable by default
    $('select item').disabled = true;

    change vs click


find element type
-----------------

```
$('#target').is('input')

$('#target').get(0).tagName.toLowerCase()
```




