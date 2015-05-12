class UpperAttrMetaclass(type):

    def __new__(cls, clsname, bases, dct):
        print(cls, clsname, bases, dct)
        uppercase_attr = {}
        for name, val in dct.items():
            if not name.startswith('__'):
                uppercase_attr[name.upper()] = val
            else:
                uppercase_attr[name] = val

        return super(UpperAttrMetaclass, cls).__new__(cls, clsname, bases, uppercase_attr)


class Test:
    a = 1

    __metaclass__ = UpperAttrMetaclass

    def tt(self):
        pass


class Field:
    a = 1

    def __init__(self, x):
        self.x = x
    
    def nn(self):
        pass


Dclass = type('Dynamic', (Field, ), {'foo': 'bar'})


d = Dclass(2)
print(vars(d))
print(d.foo)


