# noqa

import sys
import datetime



try:
    from stdlib_list import stdlib_list
    # import_standard_library
    version = sys.version[:3]
    libs = stdlib_list(version)

    for lib in libs:
        statement = 'import {}'.format(lib)

        try:
            exec(statement)
        except ImportError:
            pass
except:
    pass


# useful variables
now = datetime.datetime.now()


# stdlib imports
from collections import *
from functools import *
from unicodedata import *
from pprint import pprint
pp = pprint


# 3rd party libraries
try:
    import celery
    from celery import current_app

    # import importmagic as im
    # si = im.SymbolIndex()

    import numpy as np
    import pandas as pd

except:
    print('Not imported all modules')


# data
l = [None, 3, 5.0, 'aaew', 23]
d = {1: 2, "a": "b", }
gamma = ''
beta = 'β'


def f(*args, **kwargs):
    print('sample function with {}, {}'.format(args, kwargs))


def add(x, y):
    print('calculatin {} + {}'.format(x, y))
    return x + y


def codepoint(x):
    return 'U+%04x' % ord(x)



print('============== Executed {} ============'.format(__file__))
