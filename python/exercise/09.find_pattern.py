import re

if re.match("[:][a-zA-Z][0-9][0-9][a-zA-z]", ":C21fasdfasdf"):
    print 'found'
else:
    print 'no match'
