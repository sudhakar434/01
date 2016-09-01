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


python_source = """
import os

time.sleep(5)
"""

python_source = """
os.path.dirname('.')
"""

scope = importmagic.Scope.from_source(python_source)
unresolved, unreferenced = scope.find_unresolved_and_unreferenced_symbols()

start_line, end_line, import_block = importmagic.get_update(python_source, index, unresolved, unreferenced)

python_source = importmagic.update_imports(python_source, index, unresolved, unreferenced)

print(unresolved, unreferenced)
print(start_line, end_line, import_block)
print(python_source)


print('advanced usage')

imports = importmagic.Imports(index, python_source, root_dir='/home/chillaranand/.01/python/exercise')
imports.remove(unreferenced)

for symbol in unresolved:
    for score, module, variable in index.symbol_scores(symbol):
        if variable is None:
            imports.add_import(module)
        else:
            imports.add_import_from(module, variable)
        break

python_source = imports.update_source()
print(python_source)
