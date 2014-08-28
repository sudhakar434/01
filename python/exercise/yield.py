#! /usr/bin/python


def evens( n = 1 ):
    while(True):
        if (n % 2 == 0): yield n
        n += 1

for n in evens():
    if n>10: break;
    print n


