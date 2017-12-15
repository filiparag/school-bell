import json
from os import sep, listdir
from queue import Queue
import config
import datetime
import time

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
    time_list = Queue()
    if schedules[schedule]['days'][datetime.datetime.now().weekday()] is False:
        return time_list
    current_time = (datetime.datetime.now().hour, datetime.datetime.now(
    ).minute, datetime.datetime.now().second)
    for time in schedules[schedule]['times']:
        if (time[:-1] >= current_time):
            time_list.put(time)
    return time_list


def list_names():

    if schedules is None:
        load()
    return list(schedules.keys())


def load():

    schedule_list = listdir(config.directory + 'schedules')
    global schedules
    schedules = {}
    for schedule_filename in schedule_list:
        schedule = {}
        with open(config.directory + 'schedules' + sep + schedule_filename, 'r') as schedule_file:
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


def wait_tomorrow(stop=False):

    today = datetime.datetime.now().weekday()
    tomorrow = today
    while tomorrow == today and not stop:
        tomorrow = datetime.datetime.now().weekday()
        time.sleep(0.1)
