import foo

x = 1

y = 2


class Foo:
    def __init__(self):
        super(Foo, self).__init__()


class A:
    pass


class B(A):
    pass


class Bar(B):
    def __init__(self):
        super(A, self).__init__()
