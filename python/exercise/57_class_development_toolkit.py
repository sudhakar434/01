import math


class Circle(object):

    #__slots__ = ['diameter']
    
    version = '0.1'
    
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        p = self.__perimeter()
        r = p / math.pi / 2.0
        return math.pi * r ** 2

    def perimeter(self):
        return 2 * math.pi * self.radius

    __perimeter = perimeter
        
    @classmethod
    def from_bbd(cls, bbd):
        radius = bbd / 2.0 / math.sqrt(2.0)
        return cls(radius)
        
    @staticmethod
    def hello(name):
        print('hello ', name)

    @property
    def radius(self):
        return self.diameter / 2.0

    @radius.setter
    def radius(self, radius):
        self.diameter = radius * 2.0
        
        
class Tire(Circle):

    def perimeter(self):
        return Circle.perimeter(self) * 1.25

    __perimeter = perimeter


c = Circle(1)
print(c.__dict__, c.area(), c.perimeter())

t = Tire(1)
print(t.__dict__, t.area(), t.perimeter())
