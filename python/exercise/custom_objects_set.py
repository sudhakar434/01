import os
import django
import sys
import mock
import itertools


class Person(object):
    def __init__(self, name, age):
        self.name, self.age = name, age

    def __eq__(self, other):
        return (isinstance(other, self.__class__) and
            getattr(other, 'name', None) == self.name and
            getattr(other, 'age', None) == self.age)

    def __hash__(self):
        return hash(self.name + str(self.age))


class Person2(object):
    def __init__(self, name, age):
        self.name, self.age = name, age

    def __eq__(self, other):
        return (isinstance(other, self.__class__) and
            getattr(other, 'name', None) == self.name and
            getattr(other, 'age', None) == self.age)


class Person3(object):
    def __init__(self, name, age):
        self.name, self.age = name, age


class Person4(object):
    def __init__(self, name, age):
        self.name, self.age = name, age

    def __eq__(self, other):
        return self.__dict__ == other.__dict__
