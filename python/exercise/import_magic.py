import sys

import importmagic
from importmagic import SymbolIndex


index = importmagic.SymbolIndex()


try:
    print('loading index')
    with open('index.json') as fd:
        index = SymbolIndex.deserialize(fd)
except:
    print('building index')
    index.build_index(sys.path)
    with open('index.json', 'w') as fd:
        index.serialize(fd)


source = """
import os

time.sleep(5)
"""

source = """
os.path.dirname('.')
"""

source = """
import time

from bar import aaaaaaaaaaaaaaaaaaaa, bbbbbbbbbbbbbbbbbbbbbbbb, cccccccccccccccccccccccccccccccccccc

d = cccccccccccccccccccccccccccccccccccc + aaaaaaaaaaaaaaaaaaaa + bbbbbbbbbbbbbbbbbbbbbbbb
"""

scope = importmagic.Scope.from_source(source)
unresolved, unreferenced = scope.find_unresolved_and_unreferenced_symbols()

# start_line, end_line, import_block = importmagic.get_update(source, index, unresolved, unreferenced)

# source = importmagic.update_imports(source, index, unresolved, unreferenced)

# print(unresolved, unreferenced)
# print(start_line, end_line, import_block)
# print(source)


print('advanced usage')

# imports = importmagic.Imports(index, source, root_dir='/home/chillaranand/.01/python/exercise')
# imports = importmagic.Imports(index, source, root_dir='/home/chillaranand/sandbox/test/')
# imports.remove(unreferenced)

# for symbol in unresolved:
#     for score, module, variable in index.symbol_scores(symbol):
#         if variable is None:
#             imports.add_import(module)
#         else:
#             imports.add_import_from(module, variable)
#         break

# source = imports.update_source()
# print(source)
print(importmagic.importer.Imports._style)

root = '/home/chillaranand/.01/python/exercise'
_, _, x = importmagic.importer.get_update(source, index, set(), unreferenced, root)


print(importmagic.importer.Imports._style)

print(source)
print()
print(x)
