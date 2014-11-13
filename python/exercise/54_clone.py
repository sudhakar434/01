from copy import copy

class Avil(object):
    def __init__(self, name):
        self.name = name

    def indent(self, spaces=4):
        self.name = " " * spaces + self.name
        return copy(self)
        
    def _clone(self, *args, **kwargs):
       obj = self.__class__.__new__(self.__class__)
       obj.__dict__ = self.__dict__.copy()
       return obj


