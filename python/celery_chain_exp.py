import os

from celery import Celery


app = Celery(broker='amqp://guest@localhost//', backend='amqp://')


@app.task
def add(x, y):
    return x + y


from celery import group, chain
from celery.utils.log import get_task_logger

logger = get_task_logger(__name__)

@app.task
def create_uri(obj_json, endpoint):
    logger.debug("Created host {0} from {1}".format(uri, obj_json))
    return uri


@app.task
def send_post(uri, data):
    logger.debug("Posting {0} to {1}...".format(data, uri))
    return uri


def send_messages(objs, endpoint, data):
    chains = [(create_uri.s(obj, endpoint) | send_post.s(data)) for obj in objs]
    g = group(*chains)
    res = g.apply_async(queue="default").get()
    print("Posted to {0}".format(res))
    return res


objs = range(5)
endpoint='a'
data='b'
