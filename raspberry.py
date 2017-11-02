import config
import macro
import RPi.GPIO as GPIO

state = {
    'active': True,
    'schedule': {
        'active': 0,
        'names': ['default']
    },
    'macro': 0
}


def configure(schedule_list):

    global state
    config.verbose('Configuring Raspberry PI')
    state['schedule']['names'] = schedule_list
    load_state()
    GPIO.setwarnings(False)
    GPIO.cleanup()
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(config.get('raspberry', 'btn_power'),
               GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(config.get('raspberry', 'btn_sched'),
               GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(config.get('raspberry', 'btn_macro'),
               GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(config.get('raspberry', 'led_power'), GPIO.OUT)
    GPIO.output(config.get('raspberry', 'led_power'), not state['active'])
    GPIO.setup(config.get('raspberry', 'led_macro'), GPIO.OUT)
    GPIO.output(config.get('raspberry', 'led_macro'), 1)
    GPIO.add_event_detect(config.get('raspberry', 'btn_power'),
                          GPIO.FALLING, callback=action_active, bouncetime=100)
    GPIO.add_event_detect(config.get('raspberry', 'btn_sched'),
                          GPIO.FALLING, callback=action_schedule, bouncetime=100)
    GPIO.add_event_detect(config.get('raspberry', 'btn_macro'),
                          GPIO.FALLING, callback=action_macro, bouncetime=100)

    config.verbose('Executing macro configure.')
    macro.configure(lambda: GPIO.output(config.get('raspberry', 'led_macro'), 0),
                    lambda: GPIO.output(config.get(
                        'raspberry', 'led_macro'), 1),
                    lambda i, r: blink(config.get(
                        'raspberry', 'led_macro'), i, r),
                    config.verbose,)
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
    GPIO.output(config.get('raspberry', 'led_power'), not state['active'])
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
        blink(config.get('raspberry', 'led_power'),
              0.5, state['schedule']['active'] + 1)
        save_state()


def action_macro(channel):

    config.verbose('Macro button pressed, executing macro.')
    macro.button(lambda: GPIO.output(config.get('raspberry', 'led_macro'), 0),
                 lambda: GPIO.output(config.get('raspberry', 'led_macro'), 1),
                 lambda i, r: blink(config.get(
                     'raspberry', 'led_macro'), i, r),
                 config.verbose,)
    save_state()


def load_state():

    if config.get('raspberry', 'save'):
        global state
        config.verbose('Loading Raspberry Pi state.')
        with open(config.directory + 'gpio_state.txt', 'r') as state_file:
            saved_state = state_file.readline()
            saved_state = saved_state.split(',')
            if len(saved_state) < 3:
                saved_state = ['0'] * 3
            state['active'] = True if saved_state[0] is '1' else False
            state['schedule']['active'] = int(saved_state[1])
            state['macro'] = int(saved_state[2])
        config.verbose('Loaded state: %s, schedule: \'%s\', macro: \'%s\'' %
                       (
                           'on' if state['active'] else 'off',
                           schedule(),
                           int(state['macro'])
                       ))


def save_state():

    if config.get('raspberry', 'save'):
        global state
        with open(config.directory + 'gpio_state.txt', 'w') as state_file:
            state_file.write(','.join([
                '1' if state['active'] else '0',
                str(state['schedule']['active']),
                str(state['macro'])
            ]))


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
