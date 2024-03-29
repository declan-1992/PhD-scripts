#!/bin/bash
NBSE=1 #Select the BSE eigenvector of interest.
BSIZE=$(head -n 1 BSEFATBAND|awk '{print $1}')    #Get number of total number of transitions from the calculation
i=`echo "($BSIZE+1)*$NBSE+1"|bc`
head -n $i BSEFATBAND | tail -n $BSIZE > BSE-$NBSE.dat   #Output all trasitions to fill
