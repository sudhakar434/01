## Learning Python 
                        
#### os

     os.path.isfile('filename')
     os.path.abspath('filename')
     os.path.exists('file or dir')
     os.path.dirname('file or dir')
     os.path.getsize( 'file or dir')


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


#### itertools

     #nested list to list 
     new_list = chain.from_iterable(nested_list)
     itertools.chain(A, b, C)

     #cartesian product of two sets
     product(A, B)
     izip(a, b)
    
