import config
from macro import macro
import RPi.GPIO as GPIO

active_state = False
schedule_state = None


def configure(shedule_list):

    global active_state, schedule_state

    schedule_state = {
        'active': 0,
        'names': shedule_list
    }

    load_state()

    # GPIO.cleanup()

    GPIO.setmode(GPIO.BCM)

    GPIO.setup(config.get('raspberry', 'btn_power'), GPIO.IN)
    GPIO.setup(config.get('raspberry', 'btn_sched'), GPIO.IN)
    GPIO.setup(config.get('raspberry', 'btn_macro'), GPIO.IN)

    GPIO.add_event_detect(config.get('raspberry', 'btn_power'),
                          GPIO.BOTH, callback=action_active, bouncetime=300)
    GPIO.add_event_detect(config.get('raspberry', 'btn_sched'),
                          GPIO.BOTH, callback=action_schedule, bouncetime=300)


def active():

    return active_state


def schedule():

    return schedule_state['names'][schedule_state['active']]


def action_active(channel):

    global active_state

    active_state = not active_state
    print(active())
    save_state()


def action_schedule(channel):

    global schedule_state

    schedule_state['active'] = (schedule_state['active'] + 1)\
        % len(schedule_state['names'])
    print(schedule())
    save_state()


def action_macro(channel):

    macro()
    save_state()


def load_state():

    if config.get('raspberry', 'save'):

        global active_state, schedule_state

        with open('gpio_state.txt', 'r') as state_file:

            state = state_file.readline()
            state = state.split(',')

            if len(state) < 2:
                state = ['0', '0']

            active_state = True if state[0] is '1' else False
            schedule_state['active'] = int(state[1])


def save_state():

    if config.get('raspberry', 'save'):

        global active_state, schedule_state

        with open('gpio_state.txt', 'w') as state_file:

            state = '%s,%s' % (
                '1' if active_state else '0',
                str(schedule_state['active'])
            )

            state_file.write(state)
