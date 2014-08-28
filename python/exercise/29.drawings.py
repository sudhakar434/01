class canvas:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.data = [ [' '] * width for i in range(height) ]

    def setpixel(self, row, col):
        self.data[row][col] = '*'

    def getpixel(self, row, col):
        return self.data[row][col]

    def display(self):
        print '\n'.join( [''.join(row) for row in self.data] )


a = canvas(10,10)
a.setpixel(3,3)
a.display()

