import config
import schedule
import ringer
import pickle
import os
import threading
import time
import datetime
# import RPi.GPIO as GPIO

state = None

gpio = {
    'led': {
        'power': config.get('raspberry', 'led_power'),
        'sched': config.get('raspberry', 'led_sched'),
        'satur': config.get('raspberry', 'led_satur')
    },
    'button': {
        'power': config.get('raspberry', 'btn_power'),
        'sched': config.get('raspberry', 'btn_sched'),
        'satur': config.get('raspberry', 'btn_satur'),
        'mring': config.get('raspberry', 'btn_mring')
    },
    'check': config.get('raspberry', 'pin_check'),
    'button_state': [False] * 4,
    'connected_state': False
}

gpio_thread = threading.Thread()
bell_thread = threading.Thread()


def gpio_setup():

    config.verbose('Setting up GPIO pins')

    # GPIO.setwarnings(False)
    # GPIO.cleanup()
    # GPIO.setmode(GPIO.BCM)

    # GPIO.setup(gpio['led']['power'], GPIO.OUT)
    # for pin in gpio['led']['sched']:
    #     GPIO.setup(pin, GPIO.OUT)
    # GPIO.setup(gpio['led']['satur'], GPIO.OUT)

    # for button in gpio['button']:
    #     GPIO.setup(gpio[buttFon], GPIO.OUT)


def gpio_cycle(active):

    while active:

        if gpio_connected():

            # gpio_led()
            # gpio_poll()

            pass

            # temp
        time.sleep(0.1)


def gpio_connected():

    return True


def gpio_poll():

    print('gpio_poll()')

    # global button_state

    # while True:
    #     button_state_new_1 = [not GPIO.input(config.get('raspberry', 'btn_power')),
    #                           not GPIO.input(config.get(
    #                               'raspberry', 'btn_sched')),
    #                           not GPIO.input(config.get('raspberry', 'btn_macro'))]
    #     time.sleep(0.1)
    #     button_state_new_2 = [not GPIO.input(config.get('raspberry', 'btn_power')),
    #                           not GPIO.input(config.get(
    #                               'raspberry', 'btn_sched')),
    #                           not GPIO.input(config.get('raspberry', 'btn_macro'))]

    #     button_state_new = [one if one is two else False for one, two in
    #                         zip(button_state_new_1, button_state_new_2)]

    #     button_state_delta = [True if old is not new else False for old, new in
    #                           zip(button_state, button_state_new)]

    #     button_state = button_state_new

    #     if button_state_delta != [False] * 3:
    #         if button_state[0]:
    #             action_active()
    #         if button_state[1]:
    #             action_schedule()
    #         if button_state[2]:
    #             action_macro()


def gpio_led():

    print('gpio_led()')

    # GPIO.output(gpio['led']['power'], state._led['power'])
    # GPIO.output(gpio['led']['satur'], state._led['satur'])

    # sched = 'ssche' if datetime.datetime.now().weekday() is 5 else 'sched'
    # for pin in range(gpio['led']['sched']):
    #     GPIO.output(gpio['led']['sched'][pin], state._led[sched][pin])


def gpio_button_power():

    state.active(not state._active)
    config.verbose('Power button pressed!')


def gpio_button_schedule():

    state.schedule(next=True, saturday=state._saturday)
    config.verbose('Schedule button pressed!')


def gpio_button_saturday():

    state.saturday(not state._saturday)
    config.verbose('Saturday button pressed!')


def gpio_button_ring():

    config.verbose('Ring button pressed!')


class State:

    def __init__(self):

        self._active = None
        self._schedule = None
        self._saturday = None
        self._schedule_saturday = None

        self._led = {
            'power': False,
            'sched': (0, 0, 0),
            'ssche': (0, 0, 0),
            'satur': False
        }

        if not self.load():

            self.active(False)
            self.saturday(False)
            self.schedule(name=config.get('bell', 'schedule'))
            self.schedule(name=config.get(
                'raspberry', 'sch_satur'), saturday=True)

            self.save()

            config.verbose('Using default GPIO state values')

    def active(self, value=None):

        if value is not None:
            self._active = value
        else:
            self._active = not self._active
        self.led('active', value)

        self.save()

        config.verbose('School bell is now %sactive' % ('' if value else 'in'))

    def schedule(self, name=None, next=False, saturday=False):

        if name is not None and next is True:
            raise ValueError('Schedule is double defined')

        schedule_list = schedule.list_names()
        schedule_list.sort()

        if name is not None:
            if saturday:
                self._schedule_saturday = name
                self.led(name='ssche', value=schedule_list.index(name))
                config.verbose(
                    'Current Saturday schedule is set to \'%s\'' % self._schedule_saturday)
            else:
                self._schedule = name
                self.led(name='sched', value=schedule_list.index(name))
                config.verbose('Current schedule is set to \'%s\'' %
                               self._schedule)

        if next is True:
            if saturday:
                current = schedule_list.index(self._schedule_saturday)
                self._schedule_saturday = schedule_list[(
                    current + 1) % len(schedule_list)]
                config.verbose(
                    'Current Saturday schedule is set to \'%s\'' % self._schedule_saturday)
            else:
                current = schedule_list.index(self._schedule)
                self._schedule = schedule_list[(
                    current + 1) % len(schedule_list)]
                config.verbose('Current schedule is set to \'%s\'' %
                               self._schedule)

    def saturday(self, value):

        if value is not None:
            self._saturday = value
        else:
            self._saturday = not self._saturday
        self.led('satur', value)

        self.save()

        config.verbose('School bell is now %sactive on Saturdays' %
                       ('' if value else 'in'))

    def led(self, name=None, value=False):

        if name is not None:
            if name is 'sched' or name is 'ssche':
                array = [False] * 3
                if value >= 1 and value <= 3:
                    array[value - 1] = True
                else:
                    array = [True] * 3
                self._led[name] = array
            else:
                self._led[name] = value

        self.save()

    def load(self):

        if os.path.isfile(config.directory + '.gpio_state'):
            try:
                with open(config.directory + '.gpio_state', 'rb') as pickle_file:
                    loaded_state = pickle.load(pickle_file)
                    self._active = loaded_state._active
                    self._schedule = loaded_state._schedule
                    self._saturday = loaded_state._saturday
                    self._schedule_saturday = loaded_state._schedule_saturday
                    self._led = loaded_state._led
                    config.verbose('Loaded previous GPIO state')
                    return True
            except Exception:
                config.verbose('Previous GPIO state could not be restored')
        else:
            return False

    def save(self):

        if config.get('raspberry', 'save'):
            with open(config.directory + '.gpio_state', 'wb') as pickle_file:
                pickle.dump(self, pickle_file)


def initialize():

    global state
    state = State()
    gpio_setup()


def start():

    global state
    if state is None:
        raise ValueError('GPIO is not initialized')

    config.verbose('Raspberry Pi mode is active')

    global gpio_thread
    gpio_thread = threading.Thread(
        target=gpio_cycle, args=(True,), daemon=True)
    gpio_thread.start()

    while True:

        if state._active:
            if not bell_thread.is_alive():
                today = datetime.datetime.now().weekday()
                schedule_queue = None
                if state._saturday and today == 5:
                    schedule_queue = schedule.today(state._schedule_saturday)
                else:
                    schedule_queue = schedule.today(state._schedule)
                import calendar
                if not schedule_queue.empty():
                    config.verbose('Started bell with the schedule for %s' %
                                   calendar.day_name[today])
                    bell_start(schedule_queue)

        time.sleep(.5)


def bell_start(schedule_queue):

    global bell_thread
    if bell_active():
        bell_thread = threading.Thread(
            target=ringer.start, args=(schedule_queue, bell_active,))
        bell_thread.start()


def bell_active():

    global state
    return state._active
