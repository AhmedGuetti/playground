#!/usr/bin/python3
import sys
from pyscipopt import Model 




# Initialize global values
C = 0
O = []
x = []

# Initialize the Model
M = Model()

# Check the argument values 
if len(sys.argv) < 1 :
    prin("Enter a file name")
    exit()



# get the file name
file_name = sys.argv[1]


# read the file token 
f = open(file_name,'r')
for ligne in f:
    tokens=ligne.split()
    if ((len(tokens) > 0 and tokens[0] == '#' ) or len(tokens) == 0) : continue # ignore les lignes commençant par '#'

    # print(tokens) bad debuging to see the spliting 
    
    # Get the Capacity
    if(len(tokens) == 1):
        C = int(tokens[0])
    
    # Contruct the Objective table and labels 
    else:
        x.append(M.addVar(tokens[0],vtype="B"))
        O.append((int(tokens[1]), int(tokens[2])))


# Bad Debuging
#print(C)
#print(O)

# Show the variables the have been created
print(M.getNVars()," variables déclarées : " ,x,"\n")

# create the constraine for this problem 
M.addCons(sum(O[i][0] * x[i] for i in range(1,len(O))) <= C)


# create the objective function
M.setObjective(sum(O[i][1]*x[i] for i in range(1,len(O))),"maximize")


# Run the solver
print("-----------Exécution du solveur--------")
M.optimize()
print("-----------Exécution terminée--------")

# Get out if the solution doesn't existe
if M.getStatus() != 'optimal': print('Pas de solution ?!',quit())

# Show the solutions 
print("\nSolution optimale trouvée :")
for i in range(len(O)) : print(x[i],":",M.getVal(x[i]),sep="",end=" ")
print("\nValeur =", M.getObjVal())

# show the selected objects 
print("Objets sélectionnés : ",end="")
for i in [i for i in range(len(O)) if M.getVal(x[i]) != 0]: print(i,end=" ")
print()

f.close()

