import io
import os
import sys
from contextlib import contextmanager

from foo import bar


bar()

@contextmanager
def disable_print():
    actualstdout = sys.stdout
    sys.stdout = io.StringIO()
    try:
        yield
    finally:
        sys.stdout = actualstdout

with disable_print():
    bar()
