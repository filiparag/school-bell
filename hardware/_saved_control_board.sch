EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:control_board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x20_Female J1
U 1 1 5A57D52F
P 700 2000
F 0 "J1" H 700 2500 50  0000 C CNN
F 1 "Conn_01x10_Male" H 700 1400 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x20_Pitch2.54mm" H 700 2000 50  0001 C CNN
F 3 "" H 700 2000 50  0001 C CNN
	1    700  2000
	-1   0    0    -1  
$EndComp
Text GLabel 900  1100 2    60   Input ~ 0
Vcc
Text GLabel 900  1500 2    60   Input ~ 0
GND
Text GLabel 900  2600 2    60   Input ~ 0
B_PWR
Text GLabel 900  2700 2    60   Input ~ 0
B_SCH
Text GLabel 900  2800 2    60   Input ~ 0
B_SAT
Text GLabel 900  1400 2    60   Input ~ 0
L_PWR
Text GLabel 900  1600 2    60   Input ~ 0
L_SC1
Text GLabel 900  1700 2    60   Input ~ 0
L_SC2
Text GLabel 900  1800 2    60   Input ~ 0
L_SC3
Text GLabel 900  2500 2    60   Input ~ 0
L_SAT
$Comp
L SW_Push SW_PWR1
U 1 1 5A57D761
P 3400 800
F 0 "SW_PWR1" H 3450 900 50  0000 L CNN
F 1 "SW_Push" H 3400 740 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 3400 1000 50  0001 C CNN
F 3 "" H 3400 1000 50  0001 C CNN
	1    3400 800 
	1    0    0    -1  
$EndComp
$Comp
L R R_B_PWR1
U 1 1 5A57D89F
P 2950 800
F 0 "R_B_PWR1" V 3030 800 50  0000 C CNN
F 1 "R" V 2950 800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2880 800 50  0001 C CNN
F 3 "" H 2950 800 50  0001 C CNN
	1    2950 800 
	0    1    1    0   
$EndComp
Text GLabel 2500 800  0    60   Input ~ 0
Vcc
Text GLabel 3100 650  0    60   Input ~ 0
B_PWR
Wire Wire Line
	3100 800  3200 800 
Wire Wire Line
	3100 800  3100 650 
$Comp
L LED D_PWR1
U 1 1 5A57DB6E
P 5350 900
F 0 "D_PWR1" H 5350 1000 50  0000 C CNN
F 1 "LED" H 5350 800 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5350 900 50  0001 C CNN
F 3 "" H 5350 900 50  0001 C CNN
	1    5350 900 
	-1   0    0    1   
$EndComp
Text GLabel 5700 2300 2    60   Input ~ 0
GND
$Comp
L R R_L_PWR1
U 1 1 5A57DC15
P 4950 900
F 0 "R_L_PWR1" V 5030 900 50  0000 C CNN
F 1 "R" V 4950 900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 900 50  0001 C CNN
F 3 "" H 4950 900 50  0001 C CNN
	1    4950 900 
	0    1    1    0   
$EndComp
Text GLabel 4750 900  0    60   Input ~ 0
L_PWR
Wire Wire Line
	4750 900  4800 900 
Wire Wire Line
	5100 900  5200 900 
Text GLabel 900  2900 2    60   Input ~ 0
B_RNG
Text GLabel 900  2000 2    60   Input ~ 0
CHECK
$Comp
L R R_B_SCH1
U 1 1 5A57E7ED
P 2950 1200
F 0 "R_B_SCH1" V 3030 1200 50  0000 C CNN
F 1 "R" V 2950 1200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2880 1200 50  0001 C CNN
F 3 "" H 2950 1200 50  0001 C CNN
	1    2950 1200
	0    1    1    0   
$EndComp
Text GLabel 3100 1050 0    60   Input ~ 0
B_SCH
Wire Wire Line
	3100 1200 3200 1200
Wire Wire Line
	3100 1200 3100 1050
$Comp
L R R_B_SAT1
U 1 1 5A57E88B
P 2950 1600
F 0 "R_B_SAT1" V 3030 1600 50  0000 C CNN
F 1 "R" V 2950 1600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2880 1600 50  0001 C CNN
F 3 "" H 2950 1600 50  0001 C CNN
	1    2950 1600
	0    1    1    0   
$EndComp
Text GLabel 3100 1450 0    60   Input ~ 0
B_SAT
Wire Wire Line
	3100 1600 3200 1600
Wire Wire Line
	3100 1600 3100 1450
$Comp
L R R_B_RNG1
U 1 1 5A57E922
P 2950 2000
F 0 "R_B_RNG1" V 3030 2000 50  0000 C CNN
F 1 "R" V 2950 2000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2880 2000 50  0001 C CNN
F 3 "" H 2950 2000 50  0001 C CNN
	1    2950 2000
	0    1    1    0   
$EndComp
Text GLabel 3850 2000 2    60   Input ~ 0
GND
Text GLabel 3100 1850 0    60   Input ~ 0
B_RNG
Wire Wire Line
	3100 2000 3200 2000
Wire Wire Line
	3100 2000 3100 1850
$Comp
L LED D_SC1
U 1 1 5A57ECB2
P 5350 1250
F 0 "D_SC1" H 5350 1350 50  0000 C CNN
F 1 "LED" H 5350 1150 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5350 1250 50  0001 C CNN
F 3 "" H 5350 1250 50  0001 C CNN
	1    5350 1250
	-1   0    0    1   
$EndComp
$Comp
L R R_L_SC1
U 1 1 5A57ECB9
P 4950 1250
F 0 "R_L_SC1" V 5030 1250 50  0000 C CNN
F 1 "R" V 4950 1250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 1250 50  0001 C CNN
F 3 "" H 4950 1250 50  0001 C CNN
	1    4950 1250
	0    1    1    0   
$EndComp
Text GLabel 4750 1250 0    60   Input ~ 0
L_SC1
Wire Wire Line
	4750 1250 4800 1250
Wire Wire Line
	5100 1250 5200 1250
$Comp
L LED D_SC2
U 1 1 5A57F10A
P 5350 1600
F 0 "D_SC2" H 5350 1700 50  0000 C CNN
F 1 "LED" H 5350 1500 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5350 1600 50  0001 C CNN
F 3 "" H 5350 1600 50  0001 C CNN
	1    5350 1600
	-1   0    0    1   
$EndComp
$Comp
L R R_L_SC2
U 1 1 5A57F110
P 4950 1600
F 0 "R_L_SC2" V 5030 1600 50  0000 C CNN
F 1 "R" V 4950 1600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 1600 50  0001 C CNN
F 3 "" H 4950 1600 50  0001 C CNN
	1    4950 1600
	0    1    1    0   
$EndComp
Text GLabel 4750 1600 0    60   Input ~ 0
L_SC2
Wire Wire Line
	4750 1600 4800 1600
Wire Wire Line
	5100 1600 5200 1600
$Comp
L LED D_SC3
U 1 1 5A57F163
P 5350 1950
F 0 "D_SC3" H 5350 2050 50  0000 C CNN
F 1 "LED" H 5350 1850 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5350 1950 50  0001 C CNN
F 3 "" H 5350 1950 50  0001 C CNN
	1    5350 1950
	-1   0    0    1   
$EndComp
$Comp
L R R_L_SC3
U 1 1 5A57F169
P 4950 1950
F 0 "R_L_SC3" V 5030 1950 50  0000 C CNN
F 1 "R" V 4950 1950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 1950 50  0001 C CNN
F 3 "" H 4950 1950 50  0001 C CNN
	1    4950 1950
	0    1    1    0   
$EndComp
Text GLabel 4750 1950 0    60   Input ~ 0
L_SC3
Wire Wire Line
	4750 1950 4800 1950
Wire Wire Line
	5100 1950 5200 1950
Wire Wire Line
	2500 800  2800 800 
Wire Wire Line
	2600 800  2600 2000
Wire Wire Line
	2600 1200 2800 1200
Wire Wire Line
	2600 1600 2800 1600
Connection ~ 2600 1200
Wire Wire Line
	2600 2000 2800 2000
Connection ~ 2600 1600
Connection ~ 2600 800 
Wire Wire Line
	3600 2000 3850 2000
Wire Wire Line
	3750 800  3750 2000
Wire Wire Line
	3750 1600 3600 1600
Connection ~ 3750 2000
Wire Wire Line
	3750 1200 3600 1200
Connection ~ 3750 1600
Wire Wire Line
	3750 800  3600 800 
Connection ~ 3750 1200
$Comp
L LED D_SAT1
U 1 1 5A57F8D3
P 5350 2300
F 0 "D_SAT1" H 5350 2400 50  0000 C CNN
F 1 "LED" H 5350 2200 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5350 2300 50  0001 C CNN
F 3 "" H 5350 2300 50  0001 C CNN
	1    5350 2300
	-1   0    0    1   
$EndComp
$Comp
L R R_L_SAT1
U 1 1 5A57F8D9
P 4950 2300
F 0 "R_L_SAT1" V 5030 2300 50  0000 C CNN
F 1 "R" V 4950 2300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0001 C CNN
	1    4950 2300
	0    1    1    0   
$EndComp
Text GLabel 4750 2300 0    60   Input ~ 0
L_SAT
Wire Wire Line
	4750 2300 4800 2300
Wire Wire Line
	5100 2300 5200 2300
Wire Wire Line
	5500 2300 5700 2300
Wire Wire Line
	5600 900  5600 2300
Wire Wire Line
	5600 1950 5500 1950
Connection ~ 5600 2300
Wire Wire Line
	5600 1600 5500 1600
Connection ~ 5600 1950
Wire Wire Line
	5600 1250 5500 1250
Connection ~ 5600 1600
Wire Wire Line
	5600 900  5500 900 
Connection ~ 5600 1250
$Comp
L SW_Push SW_SCH1
U 1 1 5A57FDE7
P 3400 1200
F 0 "SW_SCH1" H 3450 1300 50  0000 L CNN
F 1 "SW_Push" H 3400 1140 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 3400 1400 50  0001 C CNN
F 3 "" H 3400 1400 50  0001 C CNN
	1    3400 1200
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW_SAT1
U 1 1 5A57FE3E
P 3400 1600
F 0 "SW_SAT1" H 3450 1700 50  0000 L CNN
F 1 "SW_Push" H 3400 1540 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 3400 1800 50  0001 C CNN
F 3 "" H 3400 1800 50  0001 C CNN
	1    3400 1600
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW_RNG1
U 1 1 5A57FE96
P 3400 2000
F 0 "SW_RNG1" H 3450 2100 50  0000 L CNN
F 1 "SW_Push" H 3400 1940 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH-12mm" H 3400 2200 50  0001 C CNN
F 3 "" H 3400 2200 50  0001 C CNN
	1    3400 2000
	1    0    0    -1  
$EndComp
Text GLabel 900  3000 2    60   Input ~ 0
GND
Text GLabel 900  2300 2    60   Input ~ 0
GND
Text GLabel 900  1900 2    60   Input ~ 0
Vcc
Text GLabel 1050 3500 0    60   Input ~ 0
CHECK
Text GLabel 1150 3500 2    60   Input ~ 0
Vcc
Wire Wire Line
	1050 3500 1150 3500
$EndSCHEMATC
