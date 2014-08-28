def fun():

    try:
        print 'a'
        return
        # raise Exception('adsfdsf')

    except:
        print 'b'

    else:
        print 'c'

    finally:
        print 'd'

fun()
