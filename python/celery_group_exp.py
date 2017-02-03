import functools

from celery import Celery, group


app = Celery('avilpage', broker='amqp://guest@localhost//')


@app.task
def add(x, y):
    return x + y


@app.task
def sub(x, y):
    return x - y


def foo(x, y):
    return x | y.s(1)


tasks = [add, add, add]


chains = [
    functools.reduce(foo, tasks, sub.s(i, i)) for i in range(2)
]

print(chains)


g = group(*chains)
print(g)

res = g.apply_async(args=[1111])
