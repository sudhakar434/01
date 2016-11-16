import multiprocessing
import time


x = '11111298324'
y = '89234729834123'


# for i in x:
#     for j in y:
#         print(j)
#         time.sleep(1)
#     print('row completed')


class Consumer(multiprocessing.Process):

    def __init__(self, task_queue, result_queue):
        multiprocessing.Process.__init__(self)
        self.task_queue = task_queue
        self.result_queue = result_queue

    def run(self):
        proc_name = self.name
        while True:
            next_task = self.task_queue.get()
            if next_task is None:
                print('%s: Exiting' % proc_name)
                self.task_queue.task_done()
                break
            print('%s: %s' % (proc_name, next_task))
            answer = next_task()
            self.task_queue.task_done()
            self.result_queue.put(answer)


class Task(object):

    def __call__(self):
        return '%s * %s = %s' % (1, 1, 22)

    def __str__(self):
        return '%s * %s' % (1, 2)


def foo():
    return 1


tasks = multiprocessing.JoinableQueue()
results = multiprocessing.Queue()

# Start workers
num_workers = multiprocessing.cpu_count() * 2
workers = [Consumer(tasks, results) for i in range(num_workers)]

for w in workers:
    w.start()


# Enqueue jobs
num_jobs = len(x) * len(y)
for i in range(num_jobs):
    tasks.put(foo)


for i in range(num_workers):
    tasks.put(None)


# Wait for all of the tasks to finish
tasks.join()

# Start printing results
while num_jobs:
    result = results.get()
    print(result)
    num_jobs -= 1
