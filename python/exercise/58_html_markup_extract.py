from html.parser import HTMLParser

class TagFetcher(HTMLParser):
    def __init__(self):
        self.reset()
        self.strict = False
        self.convert_charrefs= True
        self.fed = []

    def handle_starttag(self, tag, attrs):
        self.fed.append(tag)
        if attrs:
            self.fed.append(attrs)

    def handle_endtag(self, tag):
        self.fed.append(tag)

    def handle_startendtag(self, tag, attrs):
        self.fed.append(tag)
        if attrs:
            self.fed.append(attrs)

    def get_tags(self):
        return self.fed


def get_tags(html):
    s = TagFetcher()
    s.feed(html)
    return s.get_tags()
