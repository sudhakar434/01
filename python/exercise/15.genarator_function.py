def isprime(n):
    if n == 1:
        return False
    for x in range(2, n):
        if n % x == 0:
            return False
    else:
        return True

print [i for i in range(1, 20) if isprime(i)]
        

"""
def primes(n = 1):
    while(True):
        if isprime(n):
            yield n
        n += 1


for n in primes():
    if n > 50:
        break;
    print(n)
"""
