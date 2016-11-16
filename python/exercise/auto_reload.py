import time

from django.utils import autoreload


def foo():
    while True:
        print('foo')
        print('bar')
        time.sleep(1)


autoreload.main(foo)
