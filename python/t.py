import os

from celery import Celery


app = Celery(broker='amqp://guest@localhost//', backend='amqp://')


@app.task
def add(x, y):
    return x + y
