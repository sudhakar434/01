import logging


print('hellp')
# logging.info('infoooooooooo')
# logging.warning('warningggggggggggggggg')


logging.basicConfig(filename='example.log', level=logging.DEBUG)
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
