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


class Test(object):
    a = 1

    __metaclass__ = UpperAttrMetaclass

    def tt(self):
        pass


class Normal(object):
    a = 1

    def nn(self):
        pass
