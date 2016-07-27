# coding: utf-8
import sys
print(sys.version)


# float
x = float('inf')
print(x)
print(x+1)


# str
print('foo'.title())

# print Numbers with leading zero
print(str(1).zfill(2))

# strip all spaces
''.join(' \n ff \n bar \t '.split())
'test.py'.startswith('test')
'test.py'.endswith('.py')


# dict
foo = 1
bar = 2

# create dict from variables
d = dict(((k, globals()[k]) for k in ('foo', 'bar')))

# sort dict based on value
# import operator
# sorted(d.iteritems(), key=operator.itemgetter(1))


# lists

# reverse a list
l = ["foo", "bar", "baz"]
print(l[::-1])

# index of an item in a list
print(l.index('bar'))

# reverse a list with index also
list(reversed(list(enumerate(l))))

# list comprehension doesn't leak variable
x = 2
y = [x for x in l]
print(x)


# tuples
# Tuples are immutable and usually contains heterogeneous sequence of elements


# files

# line count
test_file = './exercise/foo.txt'
print(sum(1 for line in open(test_file)))
print(len(open(test_file).read().splitlines()))

# read file into string
data = open(test_file).read()
print(data)


# builtin functions

# zip, unzip
print(list(zip('asdf', range(4))))

# print function source code
def foo():
    return 'foo'

import inspect
print(inspect.getsource(foo))


# property
class Author:
    def __init__(self, firstname=None, lastname=None):
        self.firstname = firstname
        self.lastname = lastname

    @property
    def fullname(self):
        return '{} {}'.format(self.firstname, self.lastname)

a = Author('john', 'doe')
a.fullname


# use print with repr
x, y = 5, '5'
print(x, y)
print(repr(x), repr(y))


# nested ternary
a, b = 3, 4
print(1 if a > b else -1 if a < b else 0)

a, b = 3, 3
print(1 if a > b else -1 if a < b else 0)


# list of subclasses
# vars()['foo_class'].__subclasses__()


def chunker(iterator, size):
    return (iterator[pos:pos+size] for pos in range(0, len(iterator), size))

for chunk in chunker('foobar', size=2):
    print(chunk)


x, y = 3, 31
# never use operators for singleton variable.
print(x is not y)


# null check
print(x is None)

# identity check
print(x is y)


# equality check
print(x == y)
print(id(x), id(y))

try:
    1 / 0
except:
    print('exception')
else:
    print('no exception')
finally:
    print('done')


# locals, globals, vars
"""
Python uses namespaces to keep track of variables.

local-namespace - specific to current func/method. read only

global-namespace - specific to current module, read/write

builtin-namespace - global to all modules

If locals() is called inside a function it constructs
a dictionary of the function namespace as of that moment and returns it.
Further name assignments are not reflected in the returned dictionary,
and any assignments to the dictionary are not reflected
in the actual local namespace.

If locals() is called outside a function it returns the
actual dictionary that is the current namespace.
Further changes to the namespace are reflected in the dictionary,
and changes to the dictionary are reflected in the namespace.


vars([object]) -> dictionary

Without arguments, equivalent to locals().
With an argument, equivalent to object.__dict__.
"""

# unicode

t_string = "python"
print(type(t_string))

t_bytes = b'python'
print(type(t_bytes))

t_unicode = u'python'
print(type(t_unicode))


for i in range(0xC00, 0xC7F):
    print(chr(i))


s = 'café'
print(len(s))


b = s.encode('utf8')
print(b)
print(len(b))


# U+00E1
s = 'Ω'
s.encode('utf-8')
s.encode('ascii')


# builtins

# convert dec to hex & vice versa
print(hex(122))
print(int('7a', base=16))
print(int('0x7a', base=16))
print(int('0x7a', base=0))































# standard library

# list standard libary modules
import sys
print(sys.builtin_module_names[30:35])

# list standard libary modules
from stdlib_list import stdlib_list
libraries = stdlib_list("3.5")
print(libraries[4:10])






# collections
import collections

isinstance(dict, collections.Hashable)





# copy

# shallow copy
# content is not copied by value, but just creating a new reference.
a = {1: [1,2,3]}
b = a.copy()
print(a, b)
a[1].append(4)
print(a, b)

import copy
c = copy.deepcopy(a)
print(a, c)
a[1].append(5)
print(a, c)






# datetime
import datetime

now = datetime.datetime.now()
print(now)

month = datetime.timedelta(days=31)
after_month = now + month
print(after_month)





# gc
import gc
objects = gc.get_objects()
print(len(objects))





# tracemalloc
import tracemalloc
tracemalloc.start(5)
snap1 = tracemalloc.take_snapshot()
x = 10
snap2 = tracemalloc.take_snapshot()
stats = snap2.compare_to(snap1, 'lineno')
print(len(stats))

for i in stats[:3]:
    print(i)





# itertools
import itertools

#nested list to list
n = [[1, 2], [3, 4]]
print(list(itertools.chain.from_iterable(n)))
print(list(itertools.chain(*n)))

a, b = [1, 2], [3, 4]
list(itertools.product(a, b))





# logging

# set log level
import logging
logging.getLogger("urllib3").setLevel(logging.WARNING)






# os
import os

print(os.listdir('.'))

test_file = '/tmp/foo.txt'

print(os.path.split(test_file))

print(os.path.splitext(test_file))

os.rename('foo', 'bar')
os.path.isfile(test_file)
os.path.abspath(test_file)
os.path.exists(test_file)
os.path.dirname(test_file)
os.path.getsize(test_file)
os.system('ls')





# pprint

# pretty print a object.
from pprint import pprint
d = {1:2, 3:4}
pprint(d, width=1)





# re
import re

# strip all whitespaces
pattern = re.compile(r'\s+')
print(pattern.sub('', ' \t foo \n bar \n '))

print(re.findall(r'\d+', 'hello 42 I\'m a 32 string 30'))

pattern = re.compile('(?P<year>\d{4})')
match = pattern.search('may 2013')
print(match.group('year'))






import shutil

# move files even between disks
shutil.move('foo.py', '/home/chillaranand/')




# subprocess
import subprocess
print(subprocess.check_output(['ls', '-la']))

# hide output
FNULL = open(os.devnull, 'w')
x = subprocess.check_output(['ls', '-la'], stderr=FNULL)
print()



# sys
import sys

x = [1, 2, 3]
print(sys.getsizeof(x))

print(sys._getframe().f_code.co_name)


class Cheese:
    def __init__(self, kind):
        self.kind = kind
    def __repr__(self):
        return 'Cheese(%r)' % self.kind




import weakref
stock = weakref.WeakValueDictionary()

catalog = [Cheese('Red Leicester'), Cheese('Tilsit'), Cheese('Brie'), Cheese('Parmesan')]
for cheese in catalog:
    stock[cheese.kind] = cheese
print(sorted(stock.keys()))


# In[19]:

del catalog
print(sorted(stock.keys()))


# In[20]:

del cheese
print(sorted(stock.keys()))


# In[1]:

for i in range(3):
    pass
print(i)


# In[ ]:




# ## unittest

# In[2]:

import os

def rm(filename):
    os.remove(filename)


# In[ ]:




# # Third Party Libraries

# In[44]:

# reloading a module

# py 2.x
# reload(module)

# py 3.3
#imp.reload(module)


# In[ ]:




# In[ ]:




# ## beautifulsoup

# In[45]:

with open(file_name) as fh:
    soup = BeautifulSoup(fh, parse_only=SoupStrainer('a'))
    for link in soup:
        print(link)


#

#

# ## celery

# celery status
#
# celery inspect active
#
# celery purge

# In[2]:

from datetime import datetime
result = tasks.add.apply_async(args=[1,2], eta=datetime(2014, 6, 12, 0, 0))
result = tasks.add.apply_async(args=[1,2], countdown=10)
r = tasks.add.delay()

r = tasks.add.apply_async(args=[2, 3], queues='email')

from celery.task.control import revoke
revoke(id)
revoke(id, terminate=True)

from celery.task.control import inspect
i = inspect()
i.scheduled()
i.active()
i.registered()


# task result
result = my_task.apply_async(args=[1,2])
result.ready()
result.state


# workers

celery -A apps.project.tasks worker -l info

ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9

# run worker from script
from myapp import app
argv = ['worker', '--loglevel=DEBUG',]
app.worker_main(argv)


# canvas

chain, group, chord


# ## django

# ### forms

# In[ ]:

# make all form fields not required
def __init__(self, *args, **kwargs):
    super(TestForm, self).__init__(*args, **kwargs)

    for field in self.fields:
        self.field.required = False


# In[ ]:




# ### models

# In[ ]:

# all users where pk < 5
User.objects.filter(pk__lt=5)
User.objects.filter(pk__lte=5)


# ### templates

# In[ ]:

from django.template import loader
print(loader.get_template('home.html'))

# show all templates
from django.template.loaders.app_directories import app_template_dirs
template_files = []
for template_dir in (settings.TEMPLATE_DIRS + app_template_dirs):
    for dir, dirnames, filenames in os.walk(template_dir):
        for filename in filenames:
        template_files.append(os.path.join(dir, filename))


# urls
from django.core.urlresolvers import get_resolver, resolve
get_resolver(None).reverse_dict.keys()     #All URL Patterns excluding namespaces
reverse('/')  # get view
reverse_lazy('/')  # lazy version of reverse


# admin
"{% url 'admin:index' %}"


# cli
python manage.py changepassword admin
python manage.py createsuperuser

#Reset south migrations - delete ghost migrations
rm <app-dir>/migrations/*
python manage.py schemamigration <app-name> --initial
python manage.py migrate <app-name> 0001 --fake  --delete-ghost-migrations
# Check for any errors in the construction of your models
python manage.py validate

# models
# print sql query
print(Mymodel.objects.all().query)

# show all sql queries
from django.db import connection
connection.queries

# get model to avoid circular imports
from django.db.models import get_model
get_model('<app>', '<model>')

# manually select databse
Book.objects.using('test_db').all()

# queryset database
book._state.db


# ## gunicorn
#
# ### running gunicorn
# gunicorn project.wsgi --bind 0.0.0.0:8008 --log-level debug --log-file=- --preload
#
# --env DJANGO_SETTINGS_MODULE=project.settings.production

# In[ ]:




# ## json

# In[ ]:

import json

d = ['foo', {'bar': ['baz', None, 1.0, 2]}]
j = json.dumps(d)
print(type(j), j)


# In[ ]:

y = json.loads(j)
print(type(y), y)


# In[ ]:

json_file = './exercise/test.json'
with open(json_file, 'w') as fp:
    json.dump(j, fp)

x = json.load(open(json_file))
print(type(x), x)

from collections import namedtuple
def _json_object_hook(d):
    return namedtuple('X', d.keys())(*d.values())

def json2obj(data):
    return json.loads(data, object_hook=_json_object_hook)

x = json2obj(x)
print(type(x), x)


# In[ ]:




# ## matplotlib

# In[2]:

data = [
    '2008 70372           332383',
'2009 394567          1188382',
'2010 820161          1763772',
'2011 1445142         2657936',
'2012 2065664         3328785',
'2013 2759442         3969998',
'2014 3040440         3801302',
'2015 3105720         3704174',
'2016 1238114         1438269',
]

data = [i.split() for i in data[:-1]]
y = [int(i[0]) for i in data]
q = [int(i[1]) for i in data]
a = [int(i[2]) for i in data]

users = [
    '2008 21721',
'2009 78410',
'2010 201260',
'2011 362061',
'2012 727722',
'2013 1130602',
'2014 1185788',
'2015 1271272',
'2016 589196',

]
uu = [i.split() for i in users[:-1]]
u = [int(i[1]) for i in uu]


# In[11]:

import matplotlib.pyplot as plt
import numpy as np

x = np.arange(10)

plt.xticks(y, y)
plt.plot(y, a)
plt.plot(y, q)
print(x,y,a,q)
plt.legend(['Answers', 'Questions',], loc='upper left')

plt.show()


# In[14]:

x =  [i for i in range(0, 40, 4)]
x.insert(1, 1)
print(x)


# In[33]:

x = [20, 24, 28, 32, 36]

xargs_t = [25.3, 19.2, 13, 13, 16.3]
xargs_c = [8, 12, 16, 15, 13]

para_t = [16, 12, 18, 20, 31]
para_c = [35, 48, 33, 29, 19]

py_t = [24,30,12,20,35]
py_c = [19, 15, 36, 23, 13]

plt.xticks(x, x)

plt.gca().set_color_cycle(['red', 'red', 'green', 'green', 'blue', 'blue'])

plt.plot(x, sh1_t)
plt.plot(x, para_t)
#plt.plot(x, py_t)

plt.plot(x, sh1_c)
plt.plot(x, para_c)
#plt.plot(x, py_c)

plt.legend(['xargs_time', 'xargs_cpu', 'para_time', 'para_cpu', 'py_time', 'py_cpu'],
           loc='upper left')

plt.show()


# In[7]:

import matplotlib.pyplot as plt
import numpy as np

plt.xticks(y, y)
plt.plot(y, u)

plt.legend(['New Users'], loc='upper left')

plt.show()


# In[4]:

import numpy as np
import matplotlib.pyplot as plt

N = 8
menMeans = q

ind = np.arange(N)  # the x locations for the groups
width = 0.35       # the width of the bars
print(y)
fig, ax = plt.subplots()
rects1 = ax.bar(ind, y, width, color='r')

womenMeans = a

rects2 = ax.bar(ind + width, womenMeans, width, color='y')

# add some text for labels, title and axes ticks
ax.set_ylabel('Scores')
ax.set_title('Scores by group and gender')
ax.set_xticks(ind + width)
ax.set_xticklabels(y)

ax.legend((rects1[0], rects2[0]), ('Men', 'Women'))


def autolabel(rects):
    # attach some text labels
    for rect in rects:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/2., 1.05*height,
                '%d' % int(height),
                ha='center', va='bottom')

autolabel(rects1)

plt.show()


# In[31]:

fig = plt.figure()

width = .35

plt.bar(y, a, width=width)
#plt.xticks(ind + width / 2, OX)

plt.show()


# ## nltk
#

# In[ ]:

import nltk
s = "foo!! bar's"
print(nltk.word_tokenize(s))


# In[ ]:




# ## pandas

# In[1]:

# on spot averages
import pandas as pd

df = pd.DataFrame([['a', 2], ['a', 4], ['b', 5]], columns=['x', 'y'])
print(df)
df.groupby('x')['y'].mean()


# In[2]:

# plot pie chart
get_ipython().magic('matplotlib inline')

df = pd.DataFrame([['a', 2], ['c', 4], ['b', 5]], columns=['x', 'y'])
df['y'].plot(kind='pie', title='Population distribution',
             figsize=[8,8], fontsize=10,
             labels=df['x'], label='Cities',
             autopct='%1.1f%%')


# In[14]:

d1 = pd.read_csv('./exercise/c1.csv')
d2 = pd.read_csv('./exercise/c2.csv', skiprows=2)

print(d1.columns)
print(d2.columns)
print(d2, )


# In[30]:

d3 = d2.groupby(['chr', 'pos', 'ref', 'alt']).size()
print(type(d3))
print(d3)
print(d3.columns)
#d3[d3==d1]


# In[48]:

## requests


# In[ ]:




# ## scrapy

# In[ ]:

# xpath selection
# find td with `dc.identifier.uri` as text and get text of its sibling
url = response.xpath('//td[contains(., "dc.identifier.uri")]/following-sibling::td/text()')
# find element with class `file-link` and get `href` of `a` inside it
pdf = response.xpath('//*[contains(@class, "file-link")]//a/@href')
