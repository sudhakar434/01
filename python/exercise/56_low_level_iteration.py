num = [1,2,]

print(num)
iterable = iter(num)
print(iterable)
print(next(iterable))
print(next(iterable))
print(next(iterable, 'iterable is empty'))

class Todo():

    version = 0.1
    
    def __init__(self):
        self.tasks = []

    
    # def __iter__(self):
    #     return iter(self.tasks)

    # def __iter__(self):
    #     for task in self.tasks:
    #         yield task
    @staticmethod
    def __iter__(self):
        return (t for t in self.tasks)

t = Todo()
t.tasks = [1,2,3,]
