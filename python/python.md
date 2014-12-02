## Learning Python


#### str

    'foo'.title()

     # Print Numbers with leading zero
     print str(1).zfill(2)
     print "%2d" % (1,)


#### dict, lists

     # index of an item in a list
     ["foo","bar","baz"].index('bar')
     [i for i, j in enumerate(['foo', 'bar', 'baz']) if j == 'foo']

     # create dict from variables
     dict(((k, globals()[k]) for k in ('foo', 'bar')))
     def createDict(*args): return dict(((k, eval(k)) for k in args))

     #sort dict based on value
     sorted(d.iteritems(), key=operator.itemgetter(1))

     # reverse a list
     my_list[::-1]


#### incompatible type comparision

     #numeric type comes first than non numeric type
     1 < 'a'
     #incomaptible non numeric types are sorted by name
     ['foo'] < 'foo'
     #exception: old style classes comes always first than new style
     Foo() < Bar(object)


#### files

     # line count
     sum(1 for line in open('Charts.ipynb'))
     len(open('a.txt').read().splitlines())


#### os

     os.path.isfile('filename')
     os.path.abspath('filename')
     os.path.exists('file or dir')
     os.path.dirname('file or dir')
     os.path.getsize( 'file or dir')


#### itertools

     #nested list to list
     new_list = itertools.chain.from_iterable(nested_list)
     new_list = itertools.chain(*nested_list)

     #cartesian product of two sets
     product(A, B)

     izip(a, b)
     islice(iterator, start, end, step)


#### others

     #print function source code
     inspect.getsource(function)

     # nested ternary
     1 if a > b else -1 if a < b else 0

     # list of subclasses
     vars()['foo_class'].__subclasses__()

    def chunker(iter, size):
        return ( iter[pos:pos+size] for pos in xrange(0, len(iter), size) )

     __future__.all_feature_names

     #get function name inside function
     print(sys._getframe().f_code.co_name)

    if x is not y: # never use operators for singleton variable.
    if x is None  # null check

    try:
    except:
    else:
    finally:

    pprint.pprint(dict, width=1)  # pretty print a object 
