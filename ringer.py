import config
import time
import datetime
from os import sep
from subprocess import Popen


def start(schedule, active):

    while not schedule.empty() and active():
        next_time = schedule.get()
        config.verbose('Next bell is at %s:%s:%s' %
                       (next_time[0], next_time[1], next_time[2]))
        while next_time > current_time():
            time.sleep(0.1)
            if not active():
                config.verbose('Terminating ringer')
                return
        ring(next_time[3])
    if not active():
        config.verbose('Terminating ringer')
    return


def ring(sound_file):

    sound_file_target = config.directory + 'sounds' + sep + sound_file
    Popen([config.get('bell', 'player'), sound_file_target])
    config.verbose('Playing %s with %s' %
                   (sound_file_target, config.get('bell', 'player')))


def current_time():

    offset_time = datetime.datetime.now()\
        + datetime.timedelta(seconds=config.get('bell', 'offset'))
    return (offset_time.hour, offset_time.minute, offset_time.second)
