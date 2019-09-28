#!/bin/bash

qsub sub.sh    #submit first job 
a=$(qstat -u declan92 | tail -n 1 | awk '{print $1}' | cut -c 1-7)   #set variable 'a' to the job-ID
echo $a   #ensure we have the correct ID

while qstat -f $a | grep -q Output_Path      #check if job is running 
echo $a   #check value of 'a' ... has it changed?
do
        if grep -q "Voluntary context switches" OUTCAR; then   #Check if VASP job has finished by grepping for end of job info
                mv CONTCAR POSCAR   #move geometry from last relaxation step to first
                qsub sub.sh
                sleep 7200    #sleep to wait for the submitted job to start...otherwise grep will be true
        else
                echo Come back later     #if job hasn't finished return 'come back later'
                sleep 7200    #sleep to allow the job more time to finish
        fi
a=$(qstat -u declan92 | tail -n 1 | awk '{print $1}' | cut -c 1-7)   #set 'a' = 'a' or 'a' = new job-ID after resubmission
done            
