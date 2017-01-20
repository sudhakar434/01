old_file = 'super_old.py'
new_file = 'super_new.py'

old_data = open(old_file).read()
blocks = old_data.split('\n\n\n')


def replace_super(block):

    cls_name = block.split('class ')[1].split(':')[0]

    block = block.split('\n')
    new_block = ''
    for line in block:
        if 'super' in line and cls_name in line:
            new_line = line.replace(cls_name, '').replace(', self', '')
        else:
            new_line = line

        new_block += new_line + '\n'
    new_block.strip() + '\n'
    return new_block


new_data = ''

for block in blocks:
    if block.startswith('class'):
        block = replace_super(block)
    new_data += block + '\n\n'

new_data = new_data.strip()
open(new_file, 'w+').write(new_data)

print(old_data)
print('=====================')
print(new_data)


# import difflib
# d = difflib.Differ()
# result = list(d.compare(data, new_file))
# from pprint import pprint; pprint(result)
