from functools import partial

detros = partial(sorted, reverse=True)

a = [1,234,23,234234,2323,678,678,78,23]
print(a)
print(detros(a))
