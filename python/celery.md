#### tasks               

    from datetime import datetime
    result = tasks.add.apply_async(args=[1,2], eta=datetime(2014, 06, 12, 0, 0))
    result = tasks.add.apply_async(args=[1,2], countdown=10)
    r = tasks.add.delay()


#### celery inspect 
	
    celery status
         
    celery inspect active
    
    celery purge

    from celery.task.control import revoke
    revoke(id)
    revoke(id, terminate=True)

    from celery.task.control import inspect
    i = inspect()
    i.scheduled()
    i.active()
    i.registered()


#### task result

     result = my_task.apply_async(args=[1,2])
     result.ready()
     result.state
     result.successful()
     result.result
     result.task_id
     result.task_name


#### workers
	
    celery -A apps.project.tasks worker -l info 

    ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9   

	
#### canvas

     chain, group, chord
	
