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
