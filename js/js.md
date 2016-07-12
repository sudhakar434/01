## js

### string format



## jQuery


#### selectors

```js
$('#category option[value="blog_list?category=TECH"]').prop('selected', true);
```



#### Disable button

```js
$("input[value='vcf']").click(writeData);
function writeData() {
jQuery("input[value=vcf]").attr('disabled',true);
}

// disable by default
$('select item').disabled = true;

# change vs click
```

#### find element type

```js
$('#target').is('input')

$('#target').get(0).tagName.toLowerCase()
```


# set select to an option
$('#category option[value="blog_list?category=TECH"]').prop('selected', true);



#### jquery autocomplete plugin

```js
var tissues = [
    {"label": "taaaa 1"},
    {"label": "tbbbb 2"},
    {"label": "tcccc 3"},
    {"label": "tissue 4"},
    {"label": "tissue 5"},
];

$('input#id_tissue').autocomplete({
    source: function (request, response) {
        var term = $.ui.autocomplete.escapeRegex(request.term)
            , startsWithMatcher = new RegExp("^" + term, "i")
            , startsWith = $.grep(tissues, function(value) {
                return startsWithMatcher.test(value.label || value.value || value);
            })
            , containsMatcher = new RegExp(term, "i")
            , contains = $.grep(tissues, function (value) {
                return $.inArray(value, startsWith) < 0 &&
                    containsMatcher.test(value.label || value.value || value);
            });
        response(startsWith.concat(contains));
    }
});
```



## bootstrap

```js
# make navbar link active
$(document).ready(function() {
    $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});
```
