#! /usr/bin/env python3

import config
import schedule
import ringer
from multiprocessing import Process


def start():

    if config.get('raspberry', 'gpio'):

        import raspberry

        config.verbose('Raspberry Pi mode enabled')

        raspberry.configure(schedule.list_names())
        schedule_name = raspberry.schedule()

    else:

        schedule_name = config.get('bell', 'schedule')

    config.verbose('Schedule: %s' % schedule_name)

    while True:

        schedule_queue = schedule.today(schedule_name)

        config.verbose('Fetched today\'s schedule queue')

        bell = Process(target=ringer.start, args=(schedule_queue,))
        bell.start()

        config.verbose('Started ringer process')

        if config.get('raspberry', 'gpio'):

            while schedule_name == raspberry.schedule():
                pass

            bell.terminate()

            config.verbose('Schedule change, terminating ringer process')

        else:

            bell.join()

            config.verbose('Today\'s schedule complete')
            config.verbose('Waiting for tomorrow')

            schedule.wait_tomorrow()


if __name__ == '__main__':
    start()
