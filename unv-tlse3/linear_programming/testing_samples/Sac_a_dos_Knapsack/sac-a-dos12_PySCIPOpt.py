#!/usr/bin/python3
# coding: utf-8

from pyscipopt import Model

# Les paramètres :
C = 20         # la capacité du sac
# Objets = (poids,valeur) dans une liste
O = [(11, 20), (7, 10), (5, 25), (5, 11), (4, 5), (3, 50)
    , (3, 15), (2, 12), (2, 6), (2, 5), (2, 4), (1, 30)]

M = Model()   # Le "modèle" est initialisé, et affecté à la variable M

# Création d'une liste de variables booléennes : une variable x[i] par objet i
x = []
for i in range(len(O)) : x.append(M.addVar("x"+str(i),vtype="B"))
# affichage du nombre de variables, et de leurs noms
print(M.getNVars()," variables déclarées : " ,x,"\n")

# Création de la contrainte "poids" : somme des poids pris <= C
M.addCons(sum(O[i][0] * x[i] for i in range(len(O))) <= C)

# Création de l'obectif : max. somme des valeurs
M.setObjective(sum(O[i][1]*x[i] for i in range(len(O))),"maximize")

# Lancement du solveur
print("-----------Exécution du solveur--------")
M.optimize()
print("-----------Exécution terminée--------")

# Si pas de solution optimale trouvée : on quitte l'interpréteur Python avec quit()
if M.getStatus() != 'optimal': print('Pas de solution ?!',quit())

# Lorsqu'il y a une solution optimale : on affiche les valeurs des x[i] et la valeur de l'objectif
print("\nSolution optimale trouvée :")
for i in range(len(O)) : print(x[i],":",M.getVal(x[i]),sep="",end=" ")
print("\nValeur =", M.getObjVal())

# Affichage des numéros des objets sélectionnés
print("Objets sélectionnés : ",end="")
for i in [i for i in range(len(O)) if M.getVal(x[i]) != 0]: print(i,end=" ")
print()
