#!/bin/bash

echo How many defects?   ## request the user to input the number of defects to create in the sheet

read d

i=1    ## set the iteration to 1

while [[ $i -le $d ]]    ## create while loop that keeps removing lines (atomic postions) from xyz file until the total number of defects (d) is removed
do
sed -i $((2 + RANDOM % 36000))d start.xyz    ## sed command to remove lines (atomic positions) from xyz file
i=$[$i + 1]    ## increase the iteration variable by 1
done 
