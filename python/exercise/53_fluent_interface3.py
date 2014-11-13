from copy import deepcopy, copy
from functools import wraps

def newobj(method):
    @wraps(method)
    def inner(self, *args, **kwargs):
        obj = self.__class__.__new__(self.__class__)
        obj.__dict__ = self.__dict__.copy()
        method(obj, *args, **kwargs)
        return obj
    return inner
    
class Poem3(object):
    def __init__(self, content):
        self.content = content

    def indent(self, spaces=4):
        self = copy(self)
        self.content = " " * spaces + self.content[:]
        return self

    def __str__(self):
        return self.content

class Poem2(object):
    def __init__(self, content):
        self.content = content

    @newobj
    def indent(self, spaces=4):
        self.content = " " * spaces + self.content[:]
        return self

    def __str__(self):
        return self.content

        
class Poem(object):
    def __init__(self, content):
        self.content = content

    def indent(self, spaces=4):
        self.content = " " * spaces + self.content[:]
        return self

    def __str__(self):
        return self.content

        
"""

from functools import wraps
import copy

def newobj(method):
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        obj = copy.copy(self)
        method(obj, *args, **kwargs)
        return obj
    return wrapper

import inspect

def private (method) :
    class_name = inspect.stack()[1][3]

    def privatized_method (*args, **kwargs) :
        call_frame = inspect.stack()[1][0]
        if call_frame.f_locals.has_key ('self') :
            caller_class_name = call_frame.f_locals ['self'].__class__.__name__
            if caller_class_name == class_name :
                return method (*args, **kwargs)
        raise Exception ("can't call private method")

    return privatized_method

    
class NPoem(object):
    def __init__(self, content):
        self.content = content

    @private
    def indent(self, spaces=4):
        self.content = " " * spaces + self.content


    def __pri(self, spaces=4):
        self.content = " " * spaces + self.content
        return self
         
    @newobj
    def suffix(self, content):
        self.content += " - {}".format(content)

    def __str__(self):
        return self.content

"""
