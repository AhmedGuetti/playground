#!/usr/bin/python3
# coding: utf-8


import itertools
import math
from pyscipopt import Model


# Initialize the variables and important values
C = 9
t = [6, 6, 5, 5, 5, 4, 4, 4, 4, 2, 2, 2, 2, 3, 3, 7, 7, 5, 5, 8, 8, 4, 4, 5]
minor = math.ceil(sum(t) / C)
major = range(len(t))


# create the Model
M = Model()


# make a dictionary xij where i is the object number and j is the bin number 
x = {}
for i,j in itertools.product(major,major):
  x[i,j] = M.addVar(f"x{i}{j}",vtype="B") 


# make a list of the bins yj where j is the bin bumber
y = []
for j in major:
  y.append(M.addVar(f"y{j}",vtype="B"))



# Constraint 
# make sure that an object is contained in one bin ONLY
for i in major: M.addCons(sum( x[i,j] for j in major) == 1 )

# make sure that the sum sizes of the object desn't exceed the capacity C
for j in major: M.addCons(sum( t[i]*x[i,j] for i in major) <= C)

# the yj is 1 if and only if it has some objects 
for i,j in itertools.product(major, major):
    M.addCons(x[i,j] <= y[j])

# The objetive function
M.setObjective(sum(y[j] for j in major))


# Run the solver
print("-----------Solver Start--------", end="\n")
M.optimize()
print("-----------Solver End--------", end="\n")

# Exit if the solution doesn't existe
if M.getStatus() != 'optimal': print('No solution found?!',quit())

# Show the solution all the values of variables
print("\nOptimale solution found :")

for i,j in itertools.product(major,major): print(x[i,j],":",int(M.getVal(x[i,j])),sep="",end=" ")

# Show the result in more human readable form  
print("\nNumber of optimal bins by the Algo :", M.getObjVal())
print("\nNumber of optimal bins by Logic :", minor)

# show the selected objects and there corresponding bin
print("Selected objects and there bins: ",end="\n")
for j in range(math.ceil(M.getObjVal())):
    print(f"Bin{j}:", end="\n")
    for i in major:
        if(M.getVal(x[i,j]) != 0):
            print(f"\tobject number {i}:{t[i]}", end="\n")    
print()
