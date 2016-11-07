import pusher
from pyflash.utils import envar


pusher_client = pusher.Pusher(
  app_id=envar('pusher_app_id'),
  key=envar('PUSHER_APP_KEY'),
  secret=envar('PUSHER_APP_SECRET'),
  ssl=True
)

pusher_client.trigger('test_channel', 'my_event', {'message': 'hello world'})
