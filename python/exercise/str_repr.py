class Circle:
    def __init__(self, radius):
        self.radius = radius

c = Circle(5)
print(c)

class Circle:
    def __init__(self, radius):
        self.radius = radius

    def __str__(self):
        return 'Circle: {}'.format(self.radius)


c = Circle(5)
print(c)

circles = [Circle(i) for i in range(4)]
print(circles)
