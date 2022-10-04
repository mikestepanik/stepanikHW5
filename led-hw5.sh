#!/bin/bash
#This bash script takes 2 command line arguments and performs the following
#Sets up User LED3 to be turned on or off, flash, blink (n times), or display status of LED3
#example invocation debian@beaglebone:~/cpe422$ ./led-hw5.sh blink 2
#example invocation debian@beaglebone:~/cpe422$ ./led-hw5.sh on 0 (the seconed argument to be passed is 0 as we are not blinking)
#for on, off, flash, and status, a seconed argument is not needed
#if no arguments are passed the script will prompt the user with an error and tell the user the correct usage of the command

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}


echo "Starting the led-hw5 Script"
if [ $# -eq 0 ]; then						#if no areguments are passsed
  echo "There are no arguments. Usage is:"			#prompt the user with an error
  echo -e " bashLED Command \n  where command is one of  "
  echo -e "   on, off, flash, blink or status  \n e.g. bashLED on"
  exit 2
fi

echo "The LED Commands that were passed were ($1,$2)" 

if [ "$1" == "on" ]; then
	echo "Turning the LED on..."
	removeTrigger
	echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
	echo "Turning the LED off..."
	 removeTrigger
	echo "0" >> "$LED3_PATH/brightness"
	echo
elif [ "$1" == "flash" ]; then
	echo "Flashing the LED..."
	removeTrigger
	echo "timer" >> "$LED3_PATH/trigger"
	sleep 1
	echo "100" >> "$LED3_PATH/delay_off"
	echo "100" >> "$LED3_PATH/delay_on"
	echo
	echo "Flash Process complete!"
elif	[ "$1" == "blink" ]; then				#blink process begins here
	echo "Blinking the LED $2 times........." 		#prompt for the user what is about to occur 
	removeTrigger 	
	n=$2							#setting a variable n equal to the seconed argument
  while [ $n -gt 0 ]						#blink until n = 0 (blink n times)
do
 	echo "1" >> "$LED3_PATH/brightness"  			#turn the LED on
 	sleep 1                              			#sleep/delay for 1 seconed    
 	echo "0" >> "$LED3_PATH/brightness"  			#turn the LED off
 	sleep 1			      				#delay 1 seconed
	n=$(( $n-1 ))						#decrement n by 1 
done								#end of while loop
	echo "End of blink cycle...Turning the LED off..."     	
	echo "0" >> "$LED3_PATH/brightness" 			#turn the LED off after blinking n times
	echo
	echo "Blink Process Complete!"
	echo
elif [ "$1"  == "status" ]; then
	cat "$LED3_PATH/trigger";
   	echo	
fi								#end of if statement
echo "End of the led-hw5 Script"
echo
