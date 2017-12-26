import config
import pickle
import macro
import time
import os
import RPi.GPIO as GPIO


def configure(schedule_list):

    global state
    config.verbose('Loading state')
    load_state()
    state['schedule']['names'] = schedule_list

    config.verbose('Configuring Raspberry PI')
    GPIO.setwarnings(False)
    GPIO.cleanup()
    GPIO.setmode(GPIO.BCM)

    GPIO.setup(config.get('raspberry', 'led_power'), GPIO.OUT)
    GPIO.output(config.get('raspberry', 'led_power'), state['active'])
    for led_pin in config.get('raspberry', 'led_array'):  
        GPIO.setup(led_pin, GPIO.OUT)
    set_led_array(state['led'])

    GPIO.setup(config.get('raspberry', 'btn_power'),
               GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(config.get('raspberry', 'btn_sched'),
               GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(config.get('raspberry', 'btn_macro'),
               GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.add_event_detect(config.get('raspberry', 'btn_power'),
                          GPIO.FALLING, callback=action_active, bouncetime=300)
    GPIO.add_event_detect(config.get('raspberry', 'btn_sched'),
                          GPIO.FALLING, callback=action_schedule, bouncetime=300)
    GPIO.add_event_detect(config.get('raspberry', 'btn_macro'),
                          GPIO.FALLING, callback=action_macro, bouncetime=300)

    config.verbose('Executing macro configure.')
    macro.configure(set_led_array, config.verbose,)
    save_state()


def active():

    return state['active']


def schedule():

    return state['schedule']['names'][state['schedule']['active']]


def action_active(channel):

    global state
    state['active'] = not state['active']
    config.verbose('Power button pressed, turning %s.' %
                   ('on' if state['active'] else 'off'))
    if state['active']:
        set_led_array(values=(False, False, False))
    else:
        set_led_array(number=state['schedule']['active'] + 1)
    GPIO.output(config.get('raspberry', 'led_power'), state['active'])
    config.verbose('Executing macro configure.')    
    macro.configure(set_led_array, config.verbose,)    
    save_state()

def action_schedule(channel):

    global state
    if state['active']:
        config.verbose('Schedule button pressed, ignoring.')
        blink(config.get('raspberry', 'led_power'), 0.1, 2)
    else:
        state['schedule']['active'] = (state['schedule']['active'] + 1)\
            % len(state['schedule']['names'])
        config.verbose(
            'Schedule button pressed, changing active schedule to \'%s\'.' % schedule())
        set_led_array(number=state['schedule']['active'] + 1)
    save_state()


def action_macro(channel):

    config.verbose('Macro button pressed, executing macro.')
    macro.button(set_led_array, config.verbose,)
    save_state()

def load_state():

    global state
    if os.path.isfile(config.directory + '.gpio_state'):
        with open(config.directory + '.gpio_state', 'rb') as pickle_file:
            state = pickle.load(pickle_file)
    else:
        config.verbose('No GPIO state file found, using defaults')
        state = {
            'active': True,
            'led': (False, False, False),
            'schedule': {
                'active': 0,
                'names': ['default']
            },
            'macro': None
        }



def save_state():

    global state
    with open(config.directory + '.gpio_state', 'wb') as pickle_file:
        pickle.dump(state, pickle_file)


def set_led_array(values=(False, False, False), number=None):

    global state
    if number is not None:
        if number < 1:
            values = (False, False, False)
        elif number == 1:
            values = (True, False, False)
        elif number == 2:
            values = (False, True, False)
        elif number == 3:
            values = (False, False, True)
        elif number > 3:
            values = (True, True, True)
    state['led'] = values
    for (led_pin, value) in zip(config.get('raspberry', 'led_array'), values):
        GPIO.output(led_pin, value)
    save_state()  

def blink(pin, interval, repetitions):

    from multiprocessing import Process
    blinking = Process(target=blinker, args=(pin, interval, repetitions,))
    blinking.daemon = True
    blinking.start()


def blinker(pin, interval, repetitions):

    import time
    counter = 0
    while counter < repetitions:
        GPIO.output(pin, not GPIO.input(pin))
        time.sleep(interval / 2)
        GPIO.output(pin, not GPIO.input(pin))
        time.sleep(interval / 2)
        counter += 1
