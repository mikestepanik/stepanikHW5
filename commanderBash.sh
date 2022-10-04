#!/bin/bash
#This script invokes the following application led-hw5.sh 5 times with different arguments each time
#this script takes NO ARGUMENTS ... the arguments are hard-coded into this script
echo
echo "Turning LED on"
echo
./led-hw5.sh on 0    #Turn the LED on....the seconed argument is how many times you want the LED to blink but we are not blinking here so the seconed argument is 0
sleep 1
echo "Turning LED off"
echo
./led-hw5.sh off 0 	#Turn the LED off...
sleep 1			#delay 1 seconed
echo "Reading Status of LED"
echo
./led-hw5.sh status 0 		#display the status of the LED ... this shows what is the current trigger for the LED
sleep 1
echo "Flashing the LED"
echo
./led-hw5.sh flash 0		#flash the LED with a delay specified in led-hw5.sh
sleep 1
echo "Blinking LED"
echo
./led-hw5.sh blink 3	#Blink the LED 3 times...at 0.5Hz or on for 1 second and off for one second 
sleep 1
echo
echo "Commander Process Complete!"		#prompt the user that the process has completed
echo
