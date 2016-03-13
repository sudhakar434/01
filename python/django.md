Django
======


templates
---------


    from django.template import loader
    print loader.get_template('home.html')


urls
----

    from django.core.urlresolvers import get_resolver, resolve
    get_resolver(None).reverse_dict.keys()     #All URL Patterns
    resolve('/')  # resolving URL paths to the corresponding view functions.
    reverse('/')  # similar to url template tag
    reverse_lazy('/')  # lazy version of reverse

# link to admin
"{% url 'admin:index' %}"

users
-----

    ./manage.py changepassword admin
    ./manage.py createsuperuser

    from django.contrib.auth.models import User
    user = User.objects.get(username='normaluser')
    user.is_superuser = True
    user.save()

    python manage.py shell
    from django.contrib.auth.models import User
    User.objects.filter(is_superuser=True)
    usr = User.objects.get(username='your username')
    usr.set_password('raw password')
    usr.save()


south
-----

    ./manage.py schemamigration my-app --initial
    ./manage.py migrate my-app

    ./manage.py schemamigration my-app --auto
    ./manage.py migrate my-app

    ./manage.py migrate my-app --fake


    #Reset south migrations - delete ghost migrations
    rm <app-dir>/migrations/*
    python manage.py schemamigration <app-name> --initial
    python manage.py migrate <app-name> 0001 --fake  --delete-ghost-migrations

    # Check for any errors in the construction of your models
    ./manage.py validate


MANAGEMENT COMMANDS
===================

sql
---

```
django-admin.py sql <app>
django-admin.py sqlall <app>
django-admin.py sqlclear <app>
django-admin.py sqlcustom <app>
django-admin.py sqlindexes <app>
django-admin.py sqldropindexes <app>
django-admin.py sqlflush
```

```

```

shell
-----

```
django-admin.py shell
django-admin.py shell --plain --no-startup
django-admin.py shell -i ipython
django-admin.py shell --interface bpython
```


models
------

```
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
```


templates
---------

```
from django.conf import settings
from django.template.loaders.app_directories import app_template_dirs

import os

template_files = []
for template_dir in (settings.TEMPLATE_DIRS + app_template_dirs):
    for dir, dirnames, filenames in os.walk(template_dir):
        for filename in filenames:
        template_files.append(os.path.join(dir, filename))
```


others
------

    Always use render instead of render_to_response


    python -c "import django; print(django.get_version())"
    python -c "import django; print(django.VERSION)"




imports
-------

     from django.contrib import admin

     from django.contrib.auth.decorators import login_required
     from django.contrib.auth.models import User, AbstractUser
     from django.contrib.auth.view import login

     from django.conf import settings
     from django.conf.urls import patterns, url

     from django.core.mail import send_mail
     from django.core.urlresolvers import reverse, resolver, reverse_lazy

     from django.db import models
     from django.db.models import signals
     from django.db.models.signals import post_save, m2m_changed

     from django.dispatch import receiver, Signal

     from django.forms import ModelForm

     from django.http import HttpResponseRedirect

     from django.shortcuts import (render, render_to_response,
          HttpResponse, HttpResponseRedirect)

     from django.template import loader, RequestContext

     from django.test import TestCase
     from django.test.client import Client
     from django.test.utils import setup_test_environment, override_settings

     from django.views.generic import ListView, TemplateView
     from django.views.generic.base import View
     from django.views.generic.edit import FormView

     from django.utils import timezone
