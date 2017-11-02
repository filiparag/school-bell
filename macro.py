def configure(led_on, led_off, led_blink, log):

    from schedule import schedules
    from raspberry import schedule, state

    print(state)

    schedules[schedule()]['days'][6] = state['macro']
    if not schedules[schedule()]['days'][6]:
        led_blink(1, 1)
        log('Disabled this schedule on Saturday')
    else:
        led_blink(1, 2)
        log('Enabled this schedule on Saturday')


def button(led_on, led_off, led_blink, log):

    from schedule import schedules
    from raspberry import schedule, active, state
    from ringer import ring

    print(state)

    if active():
        if schedules[schedule()]['days'][6]:
            schedules[schedule()]['days'][6] = False
            led_blink(1, 1)
            state['macro'] = 0
            log('Disabled this schedule on Saturday')
        else:
            schedules[schedule()]['days'][6] = True
            led_blink(1, 2)
            state['macro'] = 1
            log('Enabled this schedule on Saturday')
    else:
        log('Manually playing bell')
        ring(schedules[schedule()]['times'][0][3])
        led_blink(0.5, 5)

    print(state)