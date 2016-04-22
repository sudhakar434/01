class Foo:
    s = 'python'
    b = ['p', 'y']
    c = [x for x in s]


print(Foo.c)


class Bar:
    s = 'python'
    b = ['p', 'y']
    c = [x for x in s if x in b]



print(Bar.c)
