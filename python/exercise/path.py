#! usr/bin/env python


import os
from os import path


def main():
    print os.name
    print "item exists " + str(path.exists("new.py"))
    print "item file " + str(path.isfile("new.py"))
    print "item exists " + str(path.isdir("new.py"))


    print "item path " + str(path.split( path.realpath("new.py")))

if __name__ == "__main__":
    main();
    
