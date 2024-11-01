#!/usr/bin/python3
# coding: utf-8


import itertools
import math
from pyscipopt import Model


# Initiale value of capacity and number of boxes and 
C = 9

t = [6, 6, 5, 5, 5, 4, 4, 4, 4, 2, 2, 2, 2, 3, 3, 7, 7, 5, 5, 8, 8, 4, 4, 5]

minor = math.ceil(sum(t) / C)

major = len(t)

M = Model()

x = {}
for i,j in itertools.product(range(major),range(major)):
  x[i,j] = M.addVar(f"x{i}{j}",vtype="B") 

y = []
for j in range(major):
  y.append(M.addVar(f"y{j}",vtype="B"))


# Constraint 
for i in range(major): M.addCons(sum( x[i,j] for j in range(major)) == 1 )

for j in range(major): M.addCons(sum( t[i]*x[i,j] for i in range(major)) <= C)

for i,j in itertools.product(range(major), range(major)):
    M.addCons(x[i,j] <= y[j])


# The objetive function
M.setObjective(sum(y[j] for j in range(major)))


# Run the solver
print("-----------Exécution du solveur--------")
M.optimize()
print("-----------Exécution terminée--------")

# Get out if the solution doesn't existe
if M.getStatus() != 'optimal': print('No solution found?!',quit())

# Show the solutions
print("\nOptimale solution found :")

for i,j in itertools.product(range(major),range(major)): print(x[i,j],":",int(M.getVal(x[i,j])),sep="",end=" ")
print("\nNumber of Bins =", M.getObjVal())


# show the selected objects
print("Selected objects and there bins: ",end="\n")
for j in range(math.ceil(M.getObjVal())):
    print(f"Bin{j}:", end="\n")
    for i in range(major):
        if(M.getVal(x[i,j]) != 0):
            print(f"\tobject number {i}:{t[i]}", end="\n")
    
print()
