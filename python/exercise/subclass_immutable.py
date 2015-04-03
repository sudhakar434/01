class SquaredTuple(tuple):
    def __init__(self, tup):
        super().__init__()
        self.tup = (x*x for x in tup)

        
class SquaredTuple2(tuple):
    def __new__(cls, tup):
        tup = (x*x for x in tup)
        return super().__new__(cls, tup)
        

t = (1, 2, 3)

x = SquaredTuple(t)
print(x)

x = SquaredTuple2(t)
print(x)
