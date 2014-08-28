#! usr/bin/python

class FileLineWrapper ( object ):
    def __init__(self, f):
        self.f = f
        self.line = 0

    def readline(self):
        self.line += 1
        return self.f.readline()

    def close(self):
        return self.f.close()


f = FileLineWrapper(open("links.txt"))
f.readline()
print(f.line)

