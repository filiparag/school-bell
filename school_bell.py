#! /usr/bin/env python3

import config
import schedule
import ringer


def main():

    if config.get('raspberry', 'gpio'):
        config.verbose('Running in Raspberry Pi mode')
        import raspberry
        import time
        raspberry.configure(schedule.list_names())
        while True:
            if raspberry.active():
                schedule_name = raspberry.schedule()
                schedule_queue = schedule.today(schedule_name)
                if not schedule_queue.empty():
                    config.verbose('Schedule: %s' % schedule_name)
                    ringer.start(schedule_queue, raspberry.active)
                schedule.wait_tomorrow(lambda: not raspberry.active())
            time.sleep(0.1)
    else:
        config.verbose('Running in regular mode')
        while True:
            schedule_queue = schedule.today(schedule_name)
            if not schedule_queue.empty():
                config.verbose('Schedule: %s' % schedule_name)
                ringer.start(schedule_queue, lambda: True)
            schedule.wait_tomorrow()


if __name__ == '__main__':
    main()
