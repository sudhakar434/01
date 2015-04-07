def default_args(a, b=None):
    if b is None:
        raise ValueError
    print(a, b)


_no_value = object()

def better_default_args(a, b=_no_value):
    if b is _no_value:
        raise ValueError
    print(a, b)

    
default_args(1, 2)
default_args(1, None)

better_default_args(1, 2)
better_default_args(1, None)
    
