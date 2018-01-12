def configure(set_led_vector, log):

    from schedule import schedules
    from raspberry import schedule, state, active

    schedules[schedule()]['days'][6] = state['macro']
    if not schedules[schedule()]['days'][6]:
        log('Disabled this schedule on Saturday')
        if active():
            set_led_vector(number=0)
    else:
        log('Enabled this schedule on Saturday')
        if active():
            set_led_vector(number=4)


def button(set_led_vector, log):

    from schedule import schedules
    from raspberry import schedule, active, state
    from ringer import ring

    if active():
        if schedules[schedule()]['days'][6]:
            schedules[schedule()]['days'][6] = False
            set_led_vector(number=0)
            state['macro'] = 0
            log('Disabled this schedule on Saturday')
        else:
            schedules[schedule()]['days'][6] = True
            set_led_vector(number=4)
            state['macro'] = 1
            log('Enabled this schedule on Saturday')
    else:
        log('Manually playing default bell')
        ring(schedules[schedule()]['default sound'])
