#!/usr/bin/python
  
from math import *
import numpy

ptsx = numpy.loadtxt('test_xx')   #load in positions along the x-direction
ptsy = numpy.loadtxt('test_yy')   #load in positions along the y-direction

output = open("output.dat","w+")  #set output to file output.dat with write


length=len(ptsx)       #get total number of positions



for i in range(length):      #loop over all positions
        for j in range(length):   #loop over all positions

                X = (ptsx[i]+ptsx[j])/2   #get midpoint of all bonds
                Y = (ptsy[i]+ptsy[j])/2   #get midpoint of all bonds
 
                dist = numpy.sqrt((ptsx[i]-ptsx[j])**2+(ptsy[i]-ptsy[j])**2)   #calculate distance all atoms
                if dist > 0.5 and dist < 2.5:    #if the distance falls within a certain range e.g. nearest neighbour then output to file
                        output.write("%10.8e %10.8e %10.8e\n" % (X, Y, dist))   #output

output.close()   #close output
