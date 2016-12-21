from bs4 import BeautifulSoup as BS


xml = """
<title name="bar">
    <foo>test</foo>
<title>
"""

soup = BS(xml, 'xml')

titles = soup.find_all('title')

title = titles[0]

print(title.attrs, title['name'])
print('done', '\n\n')
