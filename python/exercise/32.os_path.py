import os

base_dir = os.path.dirname(os.path.dirname(__file__))
print base_dir

base_dir = os.path.dirname(os.path.abspath(__file__))
print base_dir

another_dir = [os.path.join(base_dir, 'django')]
print another_dir
