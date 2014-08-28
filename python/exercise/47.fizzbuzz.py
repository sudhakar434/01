











for i in range(1, 50):
    if i % 3 == 0 and i % 5 == 0:
        i = 'FizzBuzz'
    elif i % 3 == 0:
        i = 'Fizz'
    elif i % 5 == 0:
        i = 'Buzz'
    else:
        pass

    print i

