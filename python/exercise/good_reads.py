import os


from goodreads import client

gr_key = os.environ.get('GR_KEY')
gr_secret = os.environ.get('GR_SECRET')
gc = client.GoodreadsClient(gr_key, gr_secret)
user = gc.user(9669859)
print(user.shelves())
