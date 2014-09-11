#### celery & django celery

	pip install Celery django-celery
	
	Broker: rabbitMQ
	sudo apt-get install rabbitmq-server 
	
	./manage.py celeryd -l info 
	
	celery status

	#kill celery tasks
	ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9   
	
	./manage.py celeryd -BE -l info 
	(run the client worker to execute tasks)
	./manage.py celeryev          
	(command line task monitoring tool)
	./manage.py celerycam
	(saves current state of events to the database)

    # Async Result Object
	result = my_task.add.apply_async(args=[1,2])
	result.ready()
	result.state
	result.successful()
	result.result
	result.task_id
	result.task_name

    # Scheduling
	from datetime import datetime
	result = tasks.add.apply_async(args=[1,2], eta=datetime(2014, 06, 12, 0, 0))
	(run task at specific time)
	result = tasks.add.apply_async(args=[1,2], countdown=10)
	(run task in 10 seconds using countdown argument)


	result.wait() 
	
	celery -A apps.project.tasks worker -l info 
	(START WORKER)
	

#### chain


#### chord


#### group
	
#### Delete all tasks

    celery purge

#### Debugging

    CELERY_TRACE_APP=1 celery worker -l info

    from celery import Task

    class DebugTask(Task):                  
    abstract = True

    def __call__(self, *args, **kwargs):
        print('TASK STARTING: {0.name}[{0.request.id}]'.format(self))
        return super(DebugTask, self).__call__(*args, **kwargs)
