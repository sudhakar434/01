#### Check if django is able to locate and load template
	from django.template import loader   
	print loader.get_template('home.html') 


#### Install django from tar ball 

    pip install https://www.djangoproject.com/download/1.0.4/tarball/    


#### Find django version 

     python -c "import django; print(django.get_version())"   
     
     python
     import django
     django.VERSION
     
     
#### Super user

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
     
#### Exit virtualenv

    deactivate


#### South 
    pip install south
    
    ./manage.py schemamigration my-app --initial
    ./manage.py migrate my-app
    
    ./manage.py schemamigration my-app --auto
    ./manage.py migrate my-app
    
    ./manage.py migrate my-app --fake


#### Reset south migrations - delete ghost migrations

    rm <app-dir>/migrations/*
    python manage.py schemamigration <app-name> --initial
    python manage.py migrate <app-name> 0001 --fake  --delete-ghost-migrations
    
    
#### Check for any errors in the construction of your models

    ./manage.py validate
    

#### ipython notebook for django
##### Install
	pip install django-shell-ipydb
#### Run
	./manage.py shell_ipynb
	
#### Run django shell with ipython or bpython or normal shell 
	./manage.py shell --interface ipython
	./manage.py shell -i ipython
	./manage.py shell -i bpython
	./manage.py shell --plain
	

#### Install django debug toolbar for better debugging.
	pip install django-debug-toolbar
	
#### Tips 

    Always use render instead of render_to_response

#### All URL Patterns 
    from django.core.urlresolvers import get_resolver
    get_resolver(None).reverse_dict.keys()
	
	
	
	
    
    

#### Django Imports - CheatSheet

     from django.contrib import admin 

     from django.contrib.auth.decorators import login_required
     from django.contrib.auth.models import User, AbstractUser
     from django.contrib.auth.view import login

     from django.conf import settings
     from django.conf.urls import patterns, url

     from django.core.mail import send_mail
     from django.core.urlresolvers import reverse   

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

