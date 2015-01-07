## Learning Python


#### str

    'foo'.title()

     # Print Numbers with leading zero
     print str(1).zfill(2)
     print "%2d" % (1,)

     # strip all whitespaces
     pattern = re.complie(r'\s+')
     pattern.sub('', ' \t foo \n bar \n ')
     ''.join(' \n ff \n bar \t '.split())

    # strip punctuation from string
    s = 'a.b'

    s.translate(string.maketrans("",""), string.punctuation)

    regex = re.compile('[%s]'.format(re.escape(string.punctuation)))
    regex.sub('', s)

    ''.join(i for i in s if i not in set(string.punctuation))

    for c in string.punctuation:


#### dict, lists, tuples

    # Tuples are immutable, usually contains heterogeneous sequence of elements
    # that are accessed by unpacking or indexing.
    # used as key in dict, slight performance improvement

    # Lists are mutable, usually contain homogeneous sequence of elements
    # that are accessed by iterating over the list.

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

     # reverse a list with index also
     reversed(list(enumerate([1,2,3])))


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



#### packages

    py 2.x reload(module)
    py 3.3 imp.reload(module)
    py 3.4 importlib.reload(module)


#### builtin functions

    #zip, unzip
    zip(range(5), range(5))
    zip(*zip(range(5), range(5)))


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
    is checks for identity
    == checks for equality

    try:
    except:
    else:
    finally:

    pprint.pprint(dict, width=1)  # pretty print a object.

    #get host name
    socket.gethostname()
    platform.node()
    os.uname()[1]

    # get size of object
    sys.getsizeof(object)
