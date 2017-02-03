// js

const x = 1;



// list the properties of a JavaScript object
var keys = Object.keys(myObject);


// determine the class of an object
Object.prototype.toString.call(myObject);


// JavaScript has function scope;
// functions get their own scope but other blocks do not.
if (true){
    var i = 5;
}
i;
// not undefined as you'd expect in a block-scoped language


// closures
// the inner function has access to all the outer function's variables, even after the outer function exits
















// jQuery


// selectors
$('#category option[value="blog_list?category=TECH"]').prop('selected', true);


// Disable button

$("input[value='vcf']").click(writeData);
function writeData() {
    jQuery("input[value=vcf]").attr('disabled',true);
}

// disable by default
$('select item').disabled = true;



// change vs click
$('#target').is('input')

$('#target').get(0).tagName.toLowerCase()


// set select to an option
$('#category option[value="blog_list?category=TECH"]').prop('selected', true);



// jquery autocomplete plugin

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












// bootstrap

// make navbar link active
$(document).ready(function() {
    $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});


























//  ember

//  Logs the arguments to the console.
var foo = 1;
Ember.Logger.log('log value of foo:', foo);
