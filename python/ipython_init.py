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
from collections import Counter

# 3rd party libraries
try:
    import celery
    from celery import current_app

    import importmagic as im
    si = im.SymbolIndex()

    import numpy as np
    import pandas as pd

except:
    print('Not imported all modules')


# data
l = [None, 3, 5.0, 'aaew', 23]

print('============== Executed {} ============'.format(__file__))
