### python


#### iterator

```
my_list[::-1]       # reverse a list
```


#### str

```
'foo'.title()

print(str(1).zfill(2))  # Print Numbers with leading zero
print("%2d" % (1,))

''.join(' \n ff \n bar \t '.split())  # strip all spaces

'test.py'.startswith('test')
'test.py'.endswith('.py')
```


#### dict

```
dict(((k, globals()[k]) for k in ('foo', 'bar')))  # create dict from variables
def createDict(*args): return dict(((k, eval(k)) for k in args))

sorted(d.iteritems(), key=operator.itemgetter(1)) #sort dict based on value
```


#### lists

```
Lists are mutable, usually contain homogeneous sequence of elements
that are accessed by iterating over the list.

["foo","bar","baz"].index('bar')  # index of an item in a list
[i for i, j in enumerate(['foo', 'bar', 'baz']) if j == 'foo']

reversed(list(enumerate([1,2,3])))  # reverse a list with index also
```


#### tuples
```
Tuples are immutable, usually contains heterogeneous sequence of elements
that are accessed by unpacking or indexing.
used as key in dict, slight performance improvement

```


#### incompatible type comparision

     #numeric type comes first than non numeric type
     1 < 'a'
     #incomaptible non numeric types are sorted by name
     ['foo'] < 'foo'
     #exception: old style classes comes always first than new style
     Foo() < Bar(object)


Files
------

     # line count
     sum(1 for line in open('foo.py'))
     len(open('a.txt').read().splitlines())

     data = open('a.txt').read()  # read file into string



#### packages

    py 2.x reload(module)
    py 3.3 imp.reload(module)
    py 3.4 importlib.reload(module)


#### builtin functions

    #zip, unzip
    zip(range(5), range(5))
    zip(*zip(range(5), range(5)))

    getattr(object, property)


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


locals, globals, vars
---------------------

Python uses namespaces to keep track of variables.

local-namespace - specific to current func/method. read only
global-namespace - specific to current module, read/write
builtin-namespace - global to all modules

If locals() is called inside a function it constructs
a dictionary of the function namespace as of that moment and returns it.
Further name assignments are not reflected in the returned dictionary,
and any assignments to the dictionary are not reflected in the actual local namespace.

If locals() is called outside a function it returns the
actual dictionary that is the current namespace.
Further changes to the namespace are reflected in the dictionary,
and changes to the dictionary are reflected in the namespace.


vars([object]) -> dictionary

Without arguments, equivalent to locals().
With an argument, equivalent to object.__dict__.
