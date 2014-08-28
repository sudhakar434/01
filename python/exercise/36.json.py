import json
 
 
try:
    json_input = '{ "one": 1, "two": { "list": [ {"item":"A"},{"item":"B"} ] } }'
    print type(json_input)
    decoded = json.loads(json_input)
 
    print type(decoded)
    # pretty printing of json-formatted string
    print json.dumps(decoded, sort_keys=True, indent=4)
 
    print "JSON parsing example: ", decoded['one']
    print "Complex JSON parsing example: ", decoded['two']['list'][1]['item']
 
except (ValueError, KeyError, TypeError):
    print "JSON format error"
