def div_dec(func):
    def func_wrap(name):
        return "<div>{0}</div>".format(func(name))
    return func_wrap


def p_dec(func):
    def func_wrap(name):
        return "<p>{0}</p>".format(func(name))
    return func_wrap

@div_dec
@p_dec
def get_text(name):
    return "hello {0}".format(name)

#my_get_text = p_dec(get_text)
print get_text('annad')
