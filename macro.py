def macro(led_on, led_off, led_blink, log):

    from schedule import schedules
    from raspberry import schedule, active
    from ringer import ring

    if active():
        if schedules[schedule()]['days'][6]:
            schedules[schedule()]['days'][6] = False
            led_blink(1, 1)
            log('Disabled this schedule on Saturday')
        else:
            schedules[schedule()]['days'][6] = True
            led_blink(1, 2)
            log('Enabled this schedule on Saturday')
    else:
        log('Manually playing bell')
        ring(schedules[schedule()]['times'][0][3])
        led_blink(0.5, 5)