## Learning Python

                        
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
    

#### str

    'foo'.title()

    
#### chunker

    def chunker(iter, size): 
        return ( iter[pos:pos+size] for pos in xrange(0, len(iter), size) )

#### __future__

     __future__.all_feature_names


#### files
     
     # line count
     sum(1 for line in open('Charts.ipynb')) 
     len(open('a.txt').read().splitlines())


#### others

     #print function source code
     inspect.getsource(function)  
 
     #sort dict based on value 
     sorted(d.iteritems(), key=operator.itemgetter(1))
    
     # nested ternary
     1 if a > b else -1 if a < b else 0
     
     # reverse a list
     my_list[::-1]

     # Print Numbers with leading zero
     print "%2d" % (1,)
     print str(1).zfill(2)

     # list of subclasses
     vars()['foo_class'].__subclasses__()

     # index of an item in a list
     ["foo","bar","baz"].index('bar')
     [i for i, j in enumerate(['foo', 'bar', 'baz']) if j == 'foo']
     
     # create dict from variables
     dict(((k, globals()[k]) for k in ('foo', 'bar')))
     def createDict(*args): return dict(((k, eval(k)) for k in args))
     

