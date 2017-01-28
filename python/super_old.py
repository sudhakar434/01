class Foo:
    def __init__(self):
        super(Foo, self).__init__()

    def test_allows_checks_relying_on_other_modeladmins(self):
        class Test():
            def check(self, **kwargs):
                errors = super(Test, self).check(**kwargs)

    class Test():
        def check(self, **kwargs):
            errors = super(MyBookAdmin, cls).check(**kwargs)

@test
class Fooo:
    def __init__(self):
        super(Fooo, self).__init__(
            'a', 'b')


# some comment
class A:
    pass


class B(A):
    pass


class Bar(B):
    def __init__(self):
        super(A, self).__init__()
