# import regular expressions
import re

contents = "this that eris ehat end start all every"

matchObj = re.search( r'(start)', contents, re.I)

if matchObj:
    print matchObj.group()
#    print matchObj.group(1)

else:
    print "no match"

