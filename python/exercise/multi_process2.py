import concurrent
import concurrent.futures
import threading
import time


x = '98324'
y = '34123'


def task():
    print('sleeping')
    time.sleep(1)
    print('{}: done with sleep'.format(threading.current_thread().name))
    return 'foo', 'bar'


pool = concurrent.futures.ProcessPoolExecutor(max_workers=4)
num_tasks = len(x) * len(y)
results = []

# for i in range(num_tasks):
#     future = pool.submit(task)
#     results.append(future)


# def results():
#     for future in results:
#         yield future.result()


for i in x:
    for j in y:
        print(i, j)
