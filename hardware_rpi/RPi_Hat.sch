EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:RPi_Hat-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 810  1000 1000 1000
U 5515D395
F0 "RPi_GPIO" 60
F1 "RPi_GPIO.sch" 60
$EndSheet
$Comp
L +3.3V #PWR01
U 1 1 5A650E60
P 8350 2950
F 0 "#PWR01" H 8350 2800 50  0001 C CNN
F 1 "+3.3V" H 8350 3090 50  0000 C CNN
F 2 "" H 8350 2950 50  0001 C CNN
F 3 "" H 8350 2950 50  0001 C CNN
	1    8350 2950
	1    0    0    -1  
$EndComp
Text GLabel 8350 3250 3    60   Input ~ 0
CHECK
$Comp
L R R_CHEK1
U 1 1 5A650E61
P 8350 3100
F 0 "R_CHEK1" V 8430 3100 50  0000 C CNN
F 1 "R" V 8350 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 8280 3100 50  0001 C CNN
F 3 "" H 8350 3100 50  0001 C CNN
	1    8350 3100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR02
U 1 1 5A650E62
P 5850 2400
F 0 "#PWR02" H 5850 2250 50  0001 C CNN
F 1 "+3.3V" H 5850 2540 50  0000 C CNN
F 2 "" H 5850 2400 50  0001 C CNN
F 3 "" H 5850 2400 50  0001 C CNN
	1    5850 2400
	1    0    0    -1  
$EndComp
$Comp
L R R_BPWR1
U 1 1 5A650E63
P 6450 2500
F 0 "R_BPWR1" V 6530 2500 50  0000 C CNN
F 1 "R" V 6450 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6380 2500 50  0001 C CNN
F 3 "" H 6450 2500 50  0001 C CNN
	1    6450 2500
	0    1    1    0   
$EndComp
Text GLabel 6350 2300 0    60   Input ~ 0
B_PWR
$Comp
L SW_Push S_BPWR1
U 1 1 5A650E64
P 6900 2500
F 0 "S_BPWR1" H 6950 2600 50  0000 L CNN
F 1 "SW_Push" H 6900 2440 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 6900 2700 50  0001 C CNN
F 3 "" H 6900 2700 50  0001 C CNN
	1    6900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2400 5850 2500
Wire Wire Line
	5850 2500 6300 2500
Wire Wire Line
	6700 2500 6600 2500
Wire Wire Line
	6350 2300 6650 2300
Wire Wire Line
	6650 2300 6650 2500
Connection ~ 6650 2500
$Comp
L GND #PWR03
U 1 1 5A650E65
P 7250 2500
F 0 "#PWR03" H 7250 2250 50  0001 C CNN
F 1 "GND" H 7250 2350 50  0000 C CNN
F 2 "" H 7250 2500 50  0001 C CNN
F 3 "" H 7250 2500 50  0001 C CNN
	1    7250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2500 7250 2500
$Comp
L +3.3V #PWR04
U 1 1 5A650E66
P 5850 2900
F 0 "#PWR04" H 5850 2750 50  0001 C CNN
F 1 "+3.3V" H 5850 3040 50  0000 C CNN
F 2 "" H 5850 2900 50  0001 C CNN
F 3 "" H 5850 2900 50  0001 C CNN
	1    5850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2900 5850 3000
Wire Wire Line
	5850 3000 6300 3000
Wire Wire Line
	6700 3000 6600 3000
Wire Wire Line
	6350 2800 6650 2800
Wire Wire Line
	6650 2800 6650 3000
Connection ~ 6650 3000
Wire Wire Line
	7100 3000 7250 3000
$Comp
L +3.3V #PWR05
U 1 1 5A650E67
P 5850 2900
F 0 "#PWR05" H 5850 2750 50  0001 C CNN
F 1 "+3.3V" H 5850 3040 50  0000 C CNN
F 2 "" H 5850 2900 50  0001 C CNN
F 3 "" H 5850 2900 50  0001 C CNN
	1    5850 2900
	1    0    0    -1  
$EndComp
$Comp
L R R_BSCH1
U 1 1 5A650E68
P 6450 3000
F 0 "R_BSCH1" V 6530 3000 50  0000 C CNN
F 1 "R" V 6450 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6380 3000 50  0001 C CNN
F 3 "" H 6450 3000 50  0001 C CNN
	1    6450 3000
	0    1    1    0   
$EndComp
$Comp
L SW_Push S_BSCH1
U 1 1 5A650E69
P 6900 3000
F 0 "S_BSCH1" H 6950 3100 50  0000 L CNN
F 1 "SW_Push" H 6900 2940 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 6900 3200 50  0001 C CNN
F 3 "" H 6900 3200 50  0001 C CNN
	1    6900 3000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5A650E6A
P 5850 3400
F 0 "#PWR06" H 5850 3250 50  0001 C CNN
F 1 "+3.3V" H 5850 3540 50  0000 C CNN
F 2 "" H 5850 3400 50  0001 C CNN
F 3 "" H 5850 3400 50  0001 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3400 5850 3500
Wire Wire Line
	5850 3500 6300 3500
Wire Wire Line
	6700 3500 6600 3500
Wire Wire Line
	6300 3300 6650 3300
Wire Wire Line
	6650 3300 6650 3500
Connection ~ 6650 3500
Wire Wire Line
	7100 3500 7250 3500
$Comp
L +3.3V #PWR07
U 1 1 5A650E6B
P 5850 3400
F 0 "#PWR07" H 5850 3250 50  0001 C CNN
F 1 "+3.3V" H 5850 3540 50  0000 C CNN
F 2 "" H 5850 3400 50  0001 C CNN
F 3 "" H 5850 3400 50  0001 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
$Comp
L R R_BSAT1
U 1 1 5A650E6C
P 6450 3500
F 0 "R_BSAT1" V 6530 3500 50  0000 C CNN
F 1 "R" V 6450 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6380 3500 50  0001 C CNN
F 3 "" H 6450 3500 50  0001 C CNN
	1    6450 3500
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5A650E6D
P 5850 3900
F 0 "#PWR08" H 5850 3750 50  0001 C CNN
F 1 "+3.3V" H 5850 4040 50  0000 C CNN
F 2 "" H 5850 3900 50  0001 C CNN
F 3 "" H 5850 3900 50  0001 C CNN
	1    5850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3900 5850 4000
Wire Wire Line
	5850 4000 6300 4000
Wire Wire Line
	6700 4000 6600 4000
Wire Wire Line
	6300 3800 6650 3800
Wire Wire Line
	6650 3800 6650 4000
Connection ~ 6650 4000
Wire Wire Line
	7100 4000 7250 4000
$Comp
L +3.3V #PWR09
U 1 1 5A650E6E
P 5850 3900
F 0 "#PWR09" H 5850 3750 50  0001 C CNN
F 1 "+3.3V" H 5850 4040 50  0000 C CNN
F 2 "" H 5850 3900 50  0001 C CNN
F 3 "" H 5850 3900 50  0001 C CNN
	1    5850 3900
	1    0    0    -1  
$EndComp
$Comp
L R R_BRNG1
U 1 1 5A650E6F
P 6450 4000
F 0 "R_BRNG1" V 6530 4000 50  0000 C CNN
F 1 "R" V 6450 4000 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6380 4000 50  0001 C CNN
F 3 "" H 6450 4000 50  0001 C CNN
	1    6450 4000
	0    1    1    0   
$EndComp
$Comp
L SW_Push S_BRNG1
U 1 1 5A650E70
P 6900 4000
F 0 "S_BRNG1" H 6950 4100 50  0000 L CNN
F 1 "SW_Push" H 6900 3940 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 6900 4200 50  0001 C CNN
F 3 "" H 6900 4200 50  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5A650E71
P 7250 4000
F 0 "#PWR010" H 7250 3750 50  0001 C CNN
F 1 "GND" H 7250 3850 50  0000 C CNN
F 2 "" H 7250 4000 50  0001 C CNN
F 3 "" H 7250 4000 50  0001 C CNN
	1    7250 4000
	1    0    0    -1  
$EndComp
Text GLabel 6350 2800 0    60   Input ~ 0
B_SCH
Text GLabel 6300 3300 0    60   Input ~ 0
B_SAT
Text GLabel 6300 3800 0    60   Input ~ 0
B_RNG
$Comp
L R R_LPWR1
U 1 1 5A650E72
P 6850 4700
F 0 "R_LPWR1" V 6930 4700 50  0000 C CNN
F 1 "R" V 6850 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6780 4700 50  0001 C CNN
F 3 "" H 6850 4700 50  0001 C CNN
	1    6850 4700
	0    1    1    0   
$EndComp
$Comp
L LED D_PWR1
U 1 1 5A650E73
P 6450 4700
F 0 "D_PWR1" H 6450 4800 50  0000 C CNN
F 1 "LED" H 6450 4600 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 6450 4700 50  0001 C CNN
F 3 "" H 6450 4700 50  0001 C CNN
	1    6450 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 4700 6600 4700
Wire Wire Line
	7000 4700 7100 4700
Text GLabel 6200 4700 0    60   Input ~ 0
L_PWR
Wire Wire Line
	6200 4700 6300 4700
$Comp
L R R_LSAT1
U 1 1 5A650E74
P 6850 5150
F 0 "R_LSAT1" V 6930 5150 50  0000 C CNN
F 1 "R" V 6850 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 6780 5150 50  0001 C CNN
F 3 "" H 6850 5150 50  0001 C CNN
	1    6850 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 5150 6600 5150
Wire Wire Line
	7000 5150 7100 5150
Text GLabel 6200 5150 0    60   Input ~ 0
L_SAT
Wire Wire Line
	6200 5150 6300 5150
$Comp
L LED D_SC1
U 1 1 5A650E75
P 8350 4700
F 0 "D_SC1" H 8350 4800 50  0000 C CNN
F 1 "LED" H 8350 4600 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 8350 4700 50  0001 C CNN
F 3 "" H 8350 4700 50  0001 C CNN
	1    8350 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 4700 8500 4700
Wire Wire Line
	8900 4700 9000 4700
Text GLabel 8100 4700 0    60   Input ~ 0
L_SC1
Wire Wire Line
	8100 4700 8200 4700
$Comp
L R R_LSC2
U 1 1 5A650E76
P 8750 5150
F 0 "R_LSC2" V 8830 5150 50  0000 C CNN
F 1 "R" V 8750 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 8680 5150 50  0001 C CNN
F 3 "" H 8750 5150 50  0001 C CNN
	1    8750 5150
	0    1    1    0   
$EndComp
$Comp
L LED D_SC2
U 1 1 5A650E77
P 8350 5150
F 0 "D_SC2" H 8350 5250 50  0000 C CNN
F 1 "LED" H 8350 5050 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 8350 5150 50  0001 C CNN
F 3 "" H 8350 5150 50  0001 C CNN
	1    8350 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 5150 8500 5150
$Comp
L GND #PWR011
U 1 1 5A650E78
P 9000 5150
F 0 "#PWR011" H 9000 4900 50  0001 C CNN
F 1 "GND" H 9000 5000 50  0000 C CNN
F 2 "" H 9000 5150 50  0001 C CNN
F 3 "" H 9000 5150 50  0001 C CNN
	1    9000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5150 9000 5150
Text GLabel 8100 5150 0    60   Input ~ 0
L_SC2
Wire Wire Line
	8100 5150 8200 5150
$Comp
L R R_LSC3
U 1 1 5A650E79
P 8750 5600
F 0 "R_LSC3" V 8830 5600 50  0000 C CNN
F 1 "R" V 8750 5600 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 8680 5600 50  0001 C CNN
F 3 "" H 8750 5600 50  0001 C CNN
	1    8750 5600
	0    1    1    0   
$EndComp
$Comp
L LED D_SC3
U 1 1 5A650E7A
P 8350 5600
F 0 "D_SC3" H 8350 5700 50  0000 C CNN
F 1 "LED" H 8350 5500 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 8350 5600 50  0001 C CNN
F 3 "" H 8350 5600 50  0001 C CNN
	1    8350 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 5600 8500 5600
$Comp
L GND #PWR012
U 1 1 5A650E7B
P 9000 5600
F 0 "#PWR012" H 9000 5350 50  0001 C CNN
F 1 "GND" H 9000 5450 50  0000 C CNN
F 2 "" H 9000 5600 50  0001 C CNN
F 3 "" H 9000 5600 50  0001 C CNN
	1    9000 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5600 9000 5600
Text GLabel 8100 5600 0    60   Input ~ 0
L_SC3
Wire Wire Line
	8100 5600 8200 5600
$Comp
L GND #PWR013
U 1 1 5A650E7C
P 7250 3000
F 0 "#PWR013" H 7250 2750 50  0001 C CNN
F 1 "GND" H 7250 2850 50  0000 C CNN
F 2 "" H 7250 3000 50  0001 C CNN
F 3 "" H 7250 3000 50  0001 C CNN
	1    7250 3000
	1    0    0    -1  
$EndComp
$Comp
L SW_Push S_BSAT1
U 1 1 5A650E7D
P 6900 3500
F 0 "S_BSAT1" H 6950 3600 50  0000 L CNN
F 1 "SW_Push" H 6900 3440 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 6900 3700 50  0001 C CNN
F 3 "" H 6900 3700 50  0001 C CNN
	1    6900 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5A650E7E
P 7250 3500
F 0 "#PWR014" H 7250 3250 50  0001 C CNN
F 1 "GND" H 7250 3350 50  0000 C CNN
F 2 "" H 7250 3500 50  0001 C CNN
F 3 "" H 7250 3500 50  0001 C CNN
	1    7250 3500
	1    0    0    -1  
$EndComp
$Comp
L R R_LSC1
U 1 1 5A650E7F
P 8750 4700
F 0 "R_LSC1" V 8830 4700 50  0000 C CNN
F 1 "R" V 8750 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_2010_HandSoldering" V 8680 4700 50  0001 C CNN
F 3 "" H 8750 4700 50  0001 C CNN
	1    8750 4700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR015
U 1 1 5A650E80
P 9000 4700
F 0 "#PWR015" H 9000 4450 50  0001 C CNN
F 1 "GND" H 9000 4550 50  0000 C CNN
F 2 "" H 9000 4700 50  0001 C CNN
F 3 "" H 9000 4700 50  0001 C CNN
	1    9000 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5A650E81
P 7100 4700
F 0 "#PWR016" H 7100 4450 50  0001 C CNN
F 1 "GND" H 7100 4550 50  0000 C CNN
F 2 "" H 7100 4700 50  0001 C CNN
F 3 "" H 7100 4700 50  0001 C CNN
	1    7100 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5A650E82
P 7100 5150
F 0 "#PWR017" H 7100 4900 50  0001 C CNN
F 1 "GND" H 7100 5000 50  0000 C CNN
F 2 "" H 7100 5150 50  0001 C CNN
F 3 "" H 7100 5150 50  0001 C CNN
	1    7100 5150
	1    0    0    -1  
$EndComp
$Comp
L LED D_SAT1
U 1 1 5A650E83
P 6450 5150
F 0 "D_SAT1" H 6450 5250 50  0000 C CNN
F 1 "LED" H 6450 5050 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 6450 5150 50  0001 C CNN
F 3 "" H 6450 5150 50  0001 C CNN
	1    6450 5150
	-1   0    0    1   
$EndComp
$EndSCHEMATC