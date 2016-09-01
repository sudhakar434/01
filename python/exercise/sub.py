import redis


r = redis.client.StrictRedis()
s = r.pubsub()

channels = ['c1', 'c2', 'c3']
for c in channels:
    s.subscribe(c)

while True:
    for m in s.listen():
        print(m)
