#! usr/bin/python

import sys

def main():
    print 'Number of arguments: ', len(sys.argv)
    print 'Arguments are:', str(sys.argv)
    print sys.argv[0]
    print sys.argv[1]
    print sys.argv[2]



if __name__ == "__main__":
    main()

