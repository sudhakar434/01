from raven import Client

url = 'https://5a222514d5a9461cab57484447a08a6d:1242bd8917324fb8a62c37f121bb47ec@sentry.appknox.com/8'

client = Client(url)


try:
    1 / 0
except ZeroDivisionError:
    client.captureException()
