import time
import threading


def threadwrap(threadfunc):
    def wrapper(f):
        while True:
            try:
                threadfunc(f)
            except BaseException as e:
                print('{!r}; restarting thread'.format(e))
            else:
                print('exited normally, bad thread; restarting')
    return wrapper


@threadwrap
def foo(name):
    while True:
        print(name)
        time.sleep(2)
        e


threads = {
    'a': threading.Thread(target=foo, args=('aaaaaa', ), name='zzzzzz'),
    'b': threading.Thread(target=foo, args=('bbbbbb', ), name='yyyyyy'),
}

for t in threads.values():
    t.start()
