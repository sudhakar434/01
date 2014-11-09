class Poem(object):
    def __init__(self, content):
        self.content = content

    def indent(self, spaces=4):
        self.content = " " * spaces + self.content[:]
        return self

    def suffix(self, content):
        self.content += " - {}".format(content[:])
        return self

    def __str__(self):
        return self.content
