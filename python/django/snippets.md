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
	
#### Installed celery & django celery
	pip install Celery django-celery
	
	For Ubuntu install rabbitmq for celery to work 
	apt-get install rabbitmq-server 
	
	./manage.py celeryd -l info 
	
	celery help
	celery -A my_app worker -l info
	celery status

	celery worker -A tasks &  # start celery in background
	ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9   #kill celery tasks
	
	Clelry tasks

	./manage.py celeryd -BE -l info 
	(run the client worker to execute tasks)
	./manage.py celeryev          
	(command line task monitoring tool)
	./manage.py celerycam
	(saves current state of events to the database)


	result = tasks.add.apply_async(args=[1,2])
	result.ready()
	result.state
	result.successful()
	result.result
	result.task_id
	result.task_name


	from datetime import datetime
	result = tasks.add.apply_async(args=[1,2], eta=datetime(2014, 06, 12, 0, 0))
	(run task at specific time)
	result = tasks.add.apply_async(args=[1,2], countdown=10)
	(run task in 10 seconds using countdown argument)


	result.wait() 
	
	celery -A apps.project.tasks worker -l info 
	(START WORKER)
	
	# celery kill all tasks
	celery purge
	
	
#### Always use render instead of render_to_response

#### All URL Patterns 
    from django.core.urlresolvers import get_resolver
    get_resolver(None).reverse_dict.keys()
	
	
	
	
    
    
