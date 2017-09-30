import config
import time
import datetime
from os import sep
from subprocess import Popen


def start(schedule):

    while not schedule.empty():

        next_time = schedule.get()

        while next_time > current_time():
            time.sleep(0.1)

        Popen([config.get('bell', 'player'),
               config.directory + 'sounds' + sep + next_time[3]])

    return


def current_time():

    offset_time = datetime.datetime.now(
    ) + datetime.timedelta(seconds=config.get('bell', 'offset'))
    return (offset_time.hour, offset_time.minute, offset_time.second)
