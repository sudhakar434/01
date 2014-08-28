class my_class:
    def hello(self):
        print 'hello';

    def improved_hello(self, name):
        print 'hello ' + name
        

def main():

    c = my_class()
    c.hello()
    c.improved_hello('anand')


if __name__ == '__main__':
    main()
