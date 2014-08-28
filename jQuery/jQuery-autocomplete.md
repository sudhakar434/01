#### Simple Autocomplete

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
