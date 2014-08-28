#! usr/bin/env python

def main():
    """
    f = open("new.py", "a+")

    for i in range(10):
        f.write("This is line %d \n" %(i+1) )
    
    f.close()
"""
    fl = open("new.py", "r")
    #contents = f.read();
    #print contents

    contents = fl.readlines()
    for i in contents:
        print i

if __name__ == "__main__":
    main();
    
