# learning about decorators

"""

def greet(name):
    return "hell " + name

greet_someone = greet

print greet_someone('asdfasdf')

"""

def greet(name):
    def get_message():
        return "hello "

    result = get_message() + name
    return result


print greet('asdf')
