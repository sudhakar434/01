def star(func):

    def wrap_star(name):
        return "**** {0} ****".format(func(name))

    return wrap_star

@star
def hello(name):
    return 'hello {0} '.format(name)


print hello('asdf')


