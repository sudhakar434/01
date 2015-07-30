x = 10
a = lambda y: x + y
x = 20
b = lambda y: x + y

print(a(10), b(10))
# x, is a free variable that gets bound at runtime, not definition time.


x = 10
a = lambda y, x=x: x + y
x = 20
print(a(10))


funcs = [lambda x: x+n for n in range(5)]
for f in funcs:
    print(f(0))

funcs = [lambda x, n=n: x+n for n in range(5)]
for f in funcs:
    print(f(0))




