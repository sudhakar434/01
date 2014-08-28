def time_dec(func):

    def wrapper(*arg):
        t = time.time()
        res = func(*arg)
        print func.func_name, time.time()-t
        return res

    return wrapper


@time_dec
def myfun(n):
    print 'adsf'

print 'asdf'
