arr2 = []
arr1 = []

var1 = '12'
var2 = '33'

li = [var1, var2]

arr1 = li
arr2.append(arr1)

arr1 = li + li
arr2.append(arr1)


from tabulate import tabulate

print tabulate(arr2, headers=['xxx', 'yyy'])
