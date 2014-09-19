## Learning Python 


#### Print Numbers with leading zero

     print "%2d" % (1,)
     print str(1).zfill(2)


#### Nested ternary

     a,b = 2,3
     1 if a > b else -1 if a < b else 0


#### Convert xls to txt file

     import xlrd
     workbook = xlrd.open_workbook('data.xls')
     worksheet = workbook.sheet_by_name('Sheet1')
     num_rows = worksheet.nrows 
     num_cells = worksheet.ncols 
     curr_row = -1

     with open("xxx.txt", "w") as fh:
          for row in range(num_rows):
               for column in range(num_cells):
                    print worksheet.cell_value(row, column)
                         fh.write("\n")
     
                        
#### os

     os.path.isfile('filename')
     os.path.exists('file or dir')
     os.path.abspath('filename')
     os.path.dirname('file or dir')
     os.path.getsize('file or dir')


#### others

    inspect.getsource(function)  #print function source code
    sorted(d.iteritems(), key=operator.itemgetter(1)) #sort dict based on value 


