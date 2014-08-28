def isprime(i):
    if i == 1:
        return False
    for x in range(2, i):
        if i % x == 0:
            return False
    else:
        return True



for i in range(1, 11):
    if isprime(i):
        print i
