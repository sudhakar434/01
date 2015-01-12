from celery import Celery
from celery.task import periodic_task
import datetime

app = Celery(broker='amqp://')
app.conf.update(
    CELERYD_LOG_COLOR=False
)

@periodic_task(run_every=datetime.timedelta(seconds=1))
def send_test_email():
    print "This is a periodic task from celery"
