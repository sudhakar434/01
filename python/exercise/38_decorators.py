import functools

def cache(f):
    storage = {}

    @functools.wraps(f)
    def inner(n):
        value = storage.get(n)
        if value:
            print('Returning from cache')
            return value
        value = f(n)
        storage[n] = value
        return value
    return inner

    
@cache
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
