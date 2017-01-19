import os

from celery import Celery

remote_broker = os.environ.get('BROKER_URL')

app = Celery('avilpage', broker=remote_broker)

print(app.broker_connection())


@app.task
def add(x, y):
    return x + y
