import logging
import multiprocessing
import sys
import time

import multiprocessing_logging


logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)


multiprocessing_logging.install_mp_handler()

data = range(10)

formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s')

s_handler = logging.StreamHandler(sys.stdout)
s_handler.setLevel(logging.DEBUG)
s_handler.setFormatter(formatter)
logger.addHandler(s_handler)

f_handler = logging.FileHandler('log.txt', mode='w')
f_handler.setFormatter(formatter)
f_handler.setLevel(logging.DEBUG)
logger.addHandler(f_handler)

logger.debug("this is test log ")


def mp_worker(data):
    logger.debug("Processs started {}".format(data))
    logger.debug("Processs started {}".format(data))
    # print("Processs started {}".format(data))
    time.sleep(4)
    logger.debug("Process done {}".format(data))
    logger.debug("Process done {}".format(data))
    # print("Process done {}".format(data))


devices = 'abcd'


def start_devices():
    p = multiprocessing.Pool(
        4,
        initializer=multiprocessing_logging.install_mp_handler
    )
    p.map(start_device, devices)


def start_device(serial_number):
    while True:
        logger.debug("Device {}".format(serial_number))
        time.sleep(1)


if __name__ == '__main__':
    start_devices()
