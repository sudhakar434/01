import logging
import sys

logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s')

s_handler = logging.StreamHandler(sys.stdout)
s_handler.setLevel(logging.DEBUG)
s_handler.setFormatter(formatter)
logger.addHandler(s_handler)

f_handler = logging.FileHandler('log.txt', mode='w')
f_handler.setFormatter(formatter)
f_handler.setLevel(logging.INFO)
logger.addHandler(f_handler)


logger.info('this is just info')
logger.debug('debugging.....')
