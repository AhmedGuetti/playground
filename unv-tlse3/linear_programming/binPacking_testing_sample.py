#!/usr/bin/python3
# coding: utf-8

import sys
import itertools
import math
from pyscipopt import Model

# Initialize the variables and important values
C = 0
t = []
name_instance = ""

# Create the Model
M = Model()

# Check command-line arguments
if len(sys.argv) < 2:
    print("Usage: script_name <file_name>")
    exit()

# Read the input file
file_name = sys.argv[1]
# read the file token
f = open(file_name,'r')
for ligne in f:
    tokens=ligne.split()
    if(len(tokens) > 1):
        C = int(tokens[0])
        n = int(tokens[1])
    else:
        if not tokens[0].isnumeric():
            name_istance = tokens[0]
        else:
            t.append(int(tokens[0]))


# Predicted number of bins based on the sum of item sizes
predicted_bins = math.ceil(sum(t) / C)
print("Predicted number of bins:", predicted_bins)

# Define decision variables
# x[i,j] indicates if item i is in bin j
x = {}
for i, j in itertools.product(range(n), range(predicted_bins)):
    x[i, j] = M.addVar(f"x_{i}_{j}", vtype="BINARY")

# y[j] indicates if bin j is used
y = {j: M.addVar(f"y_{j}", vtype="BINARY") for j in range(predicted_bins)}
z = {j: M.addVar(f"z_{j}", vtype="INTEGER", lb=0) for j in range(predicted_bins)}

# Constraints
for i in range(n):
    M.addCons(sum(x[i, j] for j in range(predicted_bins)) == 1, name=f"one_bin_per_item_{i}")

for j in range(predicted_bins):
    M.addCons(sum(t[i] * x[i, j] for i in range(n)) <= C * y[j], name=f"capacity_bin_{j}")

for i, j in itertools.product(range(n), range(predicted_bins)):
    M.addCons(x[i, j] <= y[j], name=f"bin_usage_{i}_{j}")


# for j in range(predicted_bins - 1):
#     M.addCons(sum(t[i] * x[i, j] for i in range(n)) >= sum(t[i] * x[i, j + 1] for i in range(n)), name=f"monotonicity_{j}")

# for j in range(predicted_bins - 1):
#     M.addCons(y[j] >= y[j + 1], name=f"order_usage_{j}")




# Add constraint based on the formula in the image
# for i in range(1, n):
#     for j in range(i, n): 
#         if (i, j) in x:
#             sum_terms = [x[p, j - 1] for p in range(i, n) if (p, j - 1) in x]
#             M.addCons(x[i, j] <= sum(sum_terms))



# # Precompute sum arrays for efficiency
# left_sums = {}
# right_sums = {}

# # Precompute left side sums
# for i in range(1, n):
#     left_sums[i] = [sum(x[i, s] for s in range(j, predicted_bins) if (i, s) in x) for j in range(1, predicted_bins)]

# # Precompute right side sums
# for j in range(1, predicted_bins):
#     right_sums[j] = [sum(x[p, j - 1] for p in range(i, n) if (p, j - 1) in x) for i in range(1, n)]

# # Add constraints
# for i in range(1, n):
#     for j in range(1, predicted_bins):
#         if (i, j) in x:
#             M.addCons(left_sums[i][j-1] <= right_sums[j][i-1], name=f"constraint_{i}_{j}")


# Objective function: minimize the number of bins used
M.setObjective(sum(y[j] for j in range(predicted_bins)), "minimize")



# Run the solver
print("----------- Solver Start -----------")
M.optimize()
print("----------- Solver End -----------")

# Exit if no solution is found
if M.getStatus() != 'optimal':
    print("No optimal solution found.")
    exit()

# Display the optimal solution
print("\nOptimal solution found:")
for j in range(predicted_bins):
    for i in range(n):
        if int(M.getVal(x[i, j])) == 1:
            print(f"Item {i} of size {t[i]} is placed in Bin {j}")

# Show the number of bins used
print("\nNumber of optimal bins used:", M.getObjVal())
print("\nPredicted number of bins:", predicted_bins)
f.close()
