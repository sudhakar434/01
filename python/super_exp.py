import sys
import re


old_file = 'super_old.py'
new_file = 'super_new.py'

old_file = new_file = sys.argv[1]

old_data = open(old_file).read()
if not old_data:
    sys.exit()

blocks = old_data.split('\n\n\n')


def replace_super(block):
    block = block.split('\n')

    try:
        if '(' in block[0]:
            cls_name = block[0].split('class ')[1].split('(')[0]
        else:
            cls_name = block[0].split('class ')[1].split(':')[0]
    except:
        print(block[0])
        print('0000000000000')
    replaced = False

    new_block = ''
    for line in block:
        if 'super' in line and cls_name in line:
            new_line = line.replace(cls_name, '')
            new_line = re.sub(', .*?\\)', ')', new_line)

            print(cls_name, line, new_line, sep='\n')
            print('----------------------')
            replaced = True
        else:
            new_line = line

        new_block += new_line + '\n'

    new_block = new_block.strip()
    return replaced, new_block

new_data = ''

changed = False

for block in blocks:
    if block.startswith('class'):
        replaced, block = replace_super(block)
        if replaced:
            changed = replaced
    new_data += block + '\n\n\n'

if not changed:
    sys.exit()

new_data = new_data.strip() + '\n'

open(new_file, 'w+').write(new_data)

# print(old_data)
# print('=====================')
# print(new_data)

# import difflib
# d = difflib.Differ()
# result = list(d.compare(data, new_file))
# from pprint import pprint; pprint(result)
