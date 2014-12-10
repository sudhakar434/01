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

