class Foo:
    def bar(self):
        pass
    bar.state = 2
    

print(Foo.bar.state)
print(Foo.bar)
Foo.bar.state = 3 
print(Foo.bar.state)    
# print(Foo().bar)    
# print(hasattr(Foo().bar, 'state'))
# setattr(Foo().bar, 'state', 4)


# print(f.bar.state)

# f = Foo()
# print(hasattr(Foo.bar, 'state'))
# setattr(Foo.bar, 'state', 3)
# print(f.bar.state)


