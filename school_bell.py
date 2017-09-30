#! /bin/env python3

import config
import schedule
import ringer
from multiprocessing import Process


def start():

    schedule_name = config.get('bell', 'schedule')

    while True:

        schedule_queue = schedule.today(schedule_name)

        bell = Process(target=ringer.start, args=(schedule_queue,))
        bell.start()
        bell.join()


if __name__ == '__main__':
    start()
