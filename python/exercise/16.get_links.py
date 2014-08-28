import lxml.html, urllib2, urlparse
import sys


url = str(sys.argv[1])
print url
#url = "http://ipindia.nic.in/ipr/patent/journal_archieve/journal_2013/patent_journal_2013.htm"

res = urllib2.urlopen(url)

tree = lxml.html.fromstring(res.read())

ns = {'re': 'http://exslt.org/regular-expressions'}


for node in tree.xpath('//a[re:test(@href, "\.pdf", "i")]', namespaces = ns):
    print urlparse.urljoin(url, node.attrib['href'])
