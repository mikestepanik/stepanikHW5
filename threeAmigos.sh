#!/bin/bash
#This script takes 4 command line arguments and performs the following 
# 1. Sums the first three numbers
# 2.  Executes subtractMachine.sh where the first argument is the sum you calculated in item 1 
# and the second argument is the fourth command line argument you supplied in threeAmigos.sh script.

#exmple invocation debian@beaglebone:~/cpe422$ ./threeAmigos.sh 5 5 5 4
echo
echo
ARG1=$1 # save 1st argument
ARG2=$2 # save 2nd argument
ARG3=$3 # save 3rd argument
ARG4=$4 # save 4th argument
echo Adding the first three arguments.... 
echo
sum=$(( ARG1+ARG2+ARG3 ))
echo Sum = $sum
./subtractMachine.sh $sum $4
echo
echo Full Process Complete!
echo
