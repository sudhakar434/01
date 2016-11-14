#flake8: noqa

import requests
from flask import Flask
from flask import request

app = Flask(__name__)


@app.route('/', defaults={'path': ''}, methods=['GET', 'POST'])
@app.route('/<path:path>', methods=['GET', 'POST'])
def proxy(*args, **kwargs):
    data = request.data.decode('utf-8')
    path = kwargs['path']
    params = request.form

    print('Received request: args {}, kwargs: {}, params: {}, data: {}'.format(args, kwargs, params, data))

    print('Forwading to {}'.format(url))
    requests.post(url, params=params)

    url = host + '/' + path
    print('Forwading to {}'.format(url))
    response = requests.post(url, params=params)
    return reponse


app.run()
