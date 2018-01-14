#! /usr/bin/env python3

import config
import schedule
import ringer
import argparse


def main():

    if config.get('raspberry', 'gpio'):
        config.verbose('Running in Raspberry Pi mode')
        import raspberry
        raspberry.initialize()
        raspberry.start()
    else:
        config.verbose('Running in regular mode')
        while True:
            schedule_name = config.get('bell', 'schedule')
            schedule_queue = schedule.today(schedule_name)
            if not schedule_queue.empty():
                config.verbose('Schedule: %s' % schedule_name)
                ringer.start(schedule_queue, lambda: True)
            schedule.wait_tomorrow()


if __name__ == '__main__':
    main()
