import requests


# build query url
payload = {'start': 10, 'end': 20}
response = requests.get('http://foo.com/pages', params=payload)
print(response.url)
