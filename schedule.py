import json
from os import sep, listdir
from queue import Queue
import config
import datetime

schedules = None

weekdays = {
    'Monday': 0,
    'Tuesday': 1,
    'Wednesday': 2,
    'Thursday': 3,
    'Friday': 4,
    'Saturday': 5,
    'Sunday': 6
}


def today(schedule):

    if schedules is None:
        load()

    if schedules[schedule]['days'][datetime.datetime.now().weekday()] is False:
        return None

    current_time = (datetime.datetime.now().hour, datetime.datetime.now(
    ).minute, datetime.datetime.now().second)

    time_list = Queue()

    for time in schedules[schedule]['times']:
        if (time[:-1] >= current_time):
            time_list.put(time)

    return time_list


def load():

    schedule_list = listdir(config.directory + 'schedules')

    global schedules
    schedules = {}

    for schedule_filename in schedule_list:

        schedule = {}
        with open(config.directory + 'schedules' + sep + schedule_filename) as schedule_file:

            json_decoded = json.loads(schedule_file.read())

            schedule['days'] = [False] * 7
            for key in json_decoded['days']:
                schedule['days'][weekdays[key]] = json_decoded['days'][key]

            default_sound = json_decoded['default sound']

            schedule['times'] = []
            for line in json_decoded['times']:
                if len(line) is 3:
                    line += [default_sound]
                schedule['times'] += [tuple(line)]

            schedule['times'].sort()

        schedules[schedule_filename[:-5]] = schedule
