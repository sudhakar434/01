from redbaron import RedBaron

red = RedBaron("some_value = 42")
red = RedBaron("x * True")

code = """
import time

time.sleep(10)

x = 1
y = x * 2
"""

code = """
def foo():
    return 1

foo()
"""

code = open('super_old.py').read()

red = RedBaron(code)

# print(red.dumps())

print(red.find('super'))
