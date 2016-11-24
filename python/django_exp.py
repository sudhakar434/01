# django
import django



# django settings
SESSION_EXPIRE_AT_BROWSER_CLOSE = False
SESSION_COOKIE_AGE = 5 * 60  # 5 minutes








# forms

# make all form fields not required
def __init__(self, *args, **kwargs):
    super(TestForm, self).__init__(*args, **kwargs)

    for field in self.fields:
        self.field.required = False






# models

# all users where pk < 5
User.objects.filter(pk__lt=5)
User.objects.filter(pk__lte=5)

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









# templates

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
# python manage.py changepassword admin
# python manage.py createsuperuser

# Reset south migrations - delete ghost migrations
# rm <app-dir>/migrations/*
# python manage.py schemamigration <app-name> --initial
# python manage.py migrate <app-name> 0001 --fake  --delete-ghost-migrations
# Check for any errors in the construction of your models
# python manage.py validate


# reset sql sequence
# ./manage.py sqlsequencereset app_name




# mail
import django.core.mail

from django.core.mail import mail_admins
subject = 'foo'
message = 'bar'
mail_admins(subject, message)



# management commands

# add cli argument
def add_arguments(self, parser):
    parser.add_argument('my_int_argument', type=int)

def handle(self, *args, **options):
    my_int_argument = options['my_int_argument']


# django-autofixture

# create 30 instances of model
# python manage.py loadtestdata proposals.Proposal:30








# django i18n

# templates

# db
