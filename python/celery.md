#### celery install 

     pip install Celery django-celery
	
	 sudo apt-get install rabbitmq-server 
	
	 celery status

	 #kill celery tasks
	 ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9   
	
	 ./manage.py celerycam
	 (saves current state of events to the database)


#### task result

	result = my_task.apply_async(args=[1,2])
	result.ready()
	result.state
	result.successful()
	result.result
	result.task_id
	result.task_name


#### scheduling                

	 from datetime import datetime
	 result = tasks.add.apply_async(args=[1,2], eta=datetime(2014, 06, 12, 0, 0))
	 result = tasks.add.apply_async(args=[1,2], countdown=10)


#### workers
	
	 celery -A apps.project.tasks worker -l info 

	
#### canvas

     chain, group, chord

	
#### Delete all tasks

    celery purge


#### Debugging

