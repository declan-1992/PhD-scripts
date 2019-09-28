#!/bin/bash

for a in *   #create list of all directories in current directory
do
cd $a
mv CONTCAR POSCAR
cp ~/sub_mpi.sh .    #get submission file from home directory
qsub sub_mpi.sh      #submit job
cd ..
done
