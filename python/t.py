from celery import Celery, group, chord


app = Celery(broker='amqp://guest@localhost//', backend='amqp://')


@app.task
def add(x, y):
    return x + y
