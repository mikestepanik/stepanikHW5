#!/bin/bash
#This script takes 2 command line arguments and performs the following 
# 1. subtracts the smaller argument from the larger, and then prints out the difference to stdout
# 2. Count down from the difference to 1 while printing each to stdout
#example invocation debian@beaglebone:~/cpe422$ ./subtractMachine.sh 3 8
echo
ARG1=$1 # save 1st argument
ARG2=$2 # save 2nd argument
if [ $1 -gt $2 ]
then 
difference=$((ARG1-ARG2))
echo $1 is larger than $2
else
difference=$(( ARG2-ARG1 ))
echo $2 is larger than $1

fi 
echo difference = $difference
echo
echo Subtraction Process Complete!
echo
echo Starting Countdown from difference Process....
echo
counter=0
if [ $difference -gt 0 ]
counter=$difference
then 
while [ $counter -gt 1 ]
do 
counter=$(( $counter-1 ))
echo counter=$counter
done 
difference=0
fi
echo
echo
echo Countdown Process Complete!
echo

