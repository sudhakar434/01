#! usr/bin/env python

from datetime import datetime

def main():
    today = datetime.today()
    print " datetime.today()  ", today
    print "date components are ", today.day, today.month, today.year, today.weekday()
    
    time2 = datetime.now()  
    print "the time is ", time2

if __name__ == "__main__":
    main();
    
