import unittest


class Book:

    def __init__(self, name=''):
        self.name = name

    def __nonzero__(self):
        return bool(self.name)


class TestBook(unittest.TestCase):
    def test_book_bool(self):
        b1 = Book()
        assert not bool(b1)
        b2 = Book(name='foo')
        assert bool(b2)


# b1 = Book()
# print(bool(b1))
# b2 = Book(name='foo')
# print(bool(b2))
