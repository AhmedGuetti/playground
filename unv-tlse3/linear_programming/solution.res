presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 14640 upgd conss, 0 impls, 14940 clqs
   (1.3s) probing: 1000/14520 (6.9%) - 0 fixings, 0 aggregations, 249 implications, 0 bound changes
   (1.3s) probing: 1001/14520 (6.9%) - 0 fixings, 0 aggregations, 249 implications, 0 bound changes
   (1.3s) probing aborted: 1000/1000 successive useless probings
   (1.4s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (2.0s) symmetry computation finished: 181 generators found (max: 1500, log10 of symmetry group size: 220.0) (symcode time: 0.60)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:          1 components of sizes 181
   lexicographic reduction:  181 permutations with support sizes 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 240, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242, 242
handled 1 out of 1 symmetry components
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 0 changed coefficients
 0 implications, 14940 cliques
presolved problem has 14520 variables (14520 bin, 0 int, 0 impl, 0 cont) and 14640 constraints
    120 constraints of type <knapsack>
  14520 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 2.08

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
p 2.2s|     1 |     0 |     0 |     - |  clique|   0 |  14k|  14k|  14k|   0 |  0 |   0 |   0 | 0.000000e+00 | 5.000000e+01 |    Inf | unknown
p 2.3s|     1 |     0 |     0 |     - | vbounds|   0 |  14k|  14k|  14k|   0 |  0 |  26 |   0 | 0.000000e+00 | 4.900000e+01 |    Inf | unknown
  7.9s|     1 |     0 | 16319 |     - |   292M |   0 |  14k|  14k|  14k|   0 |  0 |  26 |   0 | 1.000000e+00 | 4.900000e+01 |4800.00%| unknown
  9.9s|     1 |     0 | 16409 |     - |   306M |   0 |  14k|  14k|  14k|  15 |  1 |  26 |   0 | 1.000000e+00 | 4.900000e+01 |4800.00%| unknown
 11.4s|     1 |     0 | 16505 |     - |   313M |   0 |  14k|  14k|  14k|  37 |  2 |  26 |   0 | 1.000000e+00 | 4.900000e+01 |4800.00%| unknown
 13.0s|     1 |     0 | 16623 |     - |   324M |   0 |  14k|  14k|  14k|  59 |  3 |  26 |   0 | 1.000000e+00 | 4.900000e+01 |4800.00%| unknown
 20.3s|     1 |     0 | 27673 |     - |   333M |   0 |  14k|  14k|  14k|  76 |  4 |  26 |   0 | 1.061434e+00 | 4.900000e+01 |4516.40%| unknown
 43.6s|     1 |     0 | 55500 |     - |   338M |   0 |  14k|  14k|  14k| 122 |  5 |  26 |   0 | 3.883329e+00 | 4.900000e+01 |1161.80%| unknown
 49.2s|     1 |     0 | 66439 |     - |   354M |   0 |  14k|  14k|  14k| 146 |  6 |  26 |   0 | 1.757873e+01 | 4.900000e+01 | 178.75%| unknown
 55.5s|     1 |     0 | 76843 |     - |   356M |   0 |  14k|  14k|  14k| 190 |  7 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 57.2s|     1 |     0 | 78284 |     - |   357M |   0 |  14k|  14k|  14k| 235 |  8 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 58.1s|     1 |     0 | 79361 |     - |   358M |   0 |  14k|  14k|  14k| 279 |  9 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 59.0s|     1 |     0 | 80391 |     - |   362M |   0 |  14k|  14k|  14k| 325 | 10 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 62.0s|     1 |     0 | 86149 |     - |   363M |   0 |  14k|  14k|  15k| 366 | 11 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 63.5s|     1 |     0 | 88771 |     - |   365M |   0 |  14k|  14k|  15k| 406 | 12 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
 63.8s|     1 |     0 | 89279 |     - |   367M |   0 |  14k|  14k|  15k| 444 | 13 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 65.3s|     1 |     0 | 91948 |     - |   368M |   0 |  14k|  14k|  15k| 483 | 14 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 71.1s|     1 |     0 |102095 |     - |   371M |   0 |  14k|  14k|  15k| 520 | 15 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 72.5s|     1 |     0 |102954 |     - |   373M |   0 |  14k|  14k|  15k| 566 | 16 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 73.0s|     1 |     0 |103572 |     - |   375M |   0 |  14k|  14k|  15k| 605 | 17 |  26 |   0 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
 87.5s|     1 |     2 |123280 |     - |   377M |   0 |  14k|  14k|  15k| 605 | 17 |  26 |  35 | 4.592667e+01 | 4.900000e+01 |   6.69%| unknown
  120s|   100 |    67 |199311 | 967.1 |   406M |  24 |  14k|  14k|  15k| 715 |  1 |  67 |  35 | 4.592667e+01 | 4.900000e+01 |   6.69%|  63.66%
  145s|   200 |   161 |273547 | 854.1 |   424M |  45 |  14k|  14k|  15k| 864 |  1 |  67 |  35 | 4.592667e+01 | 4.900000e+01 |   6.69%|  63.66%
  165s|   300 |   257 |307687 | 682.7 |   450M |  45 |  14k|  14k|  15k|1142 |  1 |  67 |  73 | 4.592667e+01 | 4.900000e+01 |   6.69%|  63.66%
  197s|   400 |   357 |386932 | 710.2 |   484M |  45 |  14k|  14k|  15k|1579 |  1 |  67 |  73 | 4.592667e+01 | 4.900000e+01 |   6.69%|  63.66%

SCIP Status        : solving was interrupted [time limit reached]
Solving Time (sec) : 200.00
Solving Nodes      : 408
Primal Bound       : +4.90000000000000e+01 (10 solutions)
Dual Bound         : +4.59266666666667e+01
Gap                : 6.69 %
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 14878 upgd conss, 0 impls, 18599 clqs
   (0.4s) probing: 51/14520 (0.4%) - 0 fixings, 0 aggregations, 0 implications, 0 bound changes
   (0.4s) probing aborted: 50/50 successive totally useless probings
   (0.4s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.5s) symmetry computation finished: 62 generators found (max: 1500, log10 of symmetry group size: 0.0) (symcode time: 0.01)
dynamic symmetry handling statistics:
   orbitopal reduction:       12 components: 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3, 120x3
   orbital reduction:          6 components of sizes 4, 3, 4, 3, 3, 3
   lexicographic reduction:   38 permutations with support sizes 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240, 240
handled 36 out of 36 symmetry components
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 120 changed coefficients
 0 implications, 18599 cliques
presolved problem has 14520 variables (14520 bin, 0 int, 0 impl, 0 cont) and 14878 constraints
    239 constraints of type <knapsack>
  14639 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.47

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
 21.0s|     1 |     0 | 33262 |     - |   294M |   0 |  14k|  15k|  14k|   0 |  0 | 255 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 26.8s|     1 |     0 | 44963 |     - |   303M |   0 |  14k|  15k|  14k|  61 |  1 | 255 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 27.9s|     1 |     0 | 46306 |     - |   309M |   0 |  14k|  15k|  14k| 114 |  2 | 256 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 30.2s|     1 |     0 | 50200 |     - |   313M |   0 |  14k|  15k|  15k| 169 |  3 | 256 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 33.6s|     1 |     0 | 56569 |     - |   316M |   0 |  14k|  15k|  15k| 219 |  4 | 256 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 36.0s|     1 |     0 | 60860 |     - |   319M |   0 |  14k|  15k|  15k| 274 |  5 | 257 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 38.3s|     1 |     0 | 64997 |     - |   321M |   0 |  14k|  15k|  15k| 324 |  6 | 257 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 41.2s|     1 |     0 | 70147 |     - |   324M |   0 |  14k|  15k|  15k| 373 |  7 | 258 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 44.8s|     1 |     0 | 80276 |     - |   327M |   0 |  14k|  15k|  15k| 426 |  8 | 261 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 49.6s|     1 |     0 | 87290 |     - |   330M |   0 |  14k|  15k|  15k| 470 |  9 | 262 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 50.9s|     1 |     0 | 89160 |     - |   332M |   0 |  14k|  15k|  15k| 521 | 10 | 262 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 51.4s|     1 |     0 | 89956 |     - |   333M |   0 |  14k|  15k|  15k| 569 | 11 | 262 |   0 | 4.718667e+01 |      --      |    Inf | unknown
 56.9s|     1 |     2 | 91956 |     - |   335M |   0 |  14k|  15k|  15k| 569 | 11 | 268 |  19 | 4.718667e+01 |      --      |    Inf | unknown
  100s|   100 |    81 |147958 | 585.9 |   384M |  23 |  14k|  15k|  15k| 898 |  4 | 301 | 394 | 4.718667e+01 |      --      |    Inf | unknown
  141s|   200 |   139 |174155 | 423.1 |   413M |  27 |  14k|  15k|   0 |1075 |  0 | 837 |1534 | 4.718667e+01 |      --      |    Inf | unknown
 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
  179s|   300 |   191 |243088 | 512.1 |   427M |  27 |  14k|  15k|  15k|1457 |  1 | 978 |1534 | 4.718667e+01 |      --      |    Inf |   0.57%

SCIP Status        : solving was interrupted [time limit reached]
Solving Time (sec) : 200.00
Solving Nodes      : 351
Primal Bound       : +1.00000000000000e+20 (0 solutions)
Dual Bound         : +4.71866666666667e+01
Gap                : infinite
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 440 upgd conss, 0 impls, 560 clqs
(round 2, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 20 chg coeffs, 440 upgd conss, 0 impls, 560 clqs
   (0.0s) probing: 51/420 (12.1%) - 0 fixings, 0 aggregations, 0 implications, 0 bound changes
   (0.0s) probing aborted: 50/50 successive totally useless probings
   (0.0s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.0s) symmetry computation finished: 21 generators found (max: 1500, log10 of symmetry group size: 10.0) (symcode time: 0.00)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:          1 components of sizes 21
   lexicographic reduction:   21 permutations with support sizes 40, 42, 40, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42
handled 1 out of 1 symmetry components
presolving (3 rounds: 3 fast, 3 medium, 3 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 20 changed coefficients
 0 implications, 700 cliques
presolved problem has 420 variables (420 bin, 0 int, 0 impl, 0 cont) and 440 constraints
     20 constraints of type <knapsack>
    420 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.01

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
p 0.0s|     1 |     0 |     0 |     - |  clique|   0 | 420 | 440 | 440 |   0 |  0 |   0 |   0 | 0.000000e+00 | 9.000000e+00 |    Inf | unknown
  0.0s|     1 |     0 |   882 |     - |  9545k |   0 | 420 | 487 | 440 |   0 |  0 |  47 |   0 | 9.000000e+00 | 9.000000e+00 |   0.00%| unknown

SCIP Status        : problem is solved [optimal solution found]
Solving Time (sec) : 0.03
Solving Nodes      : 1
Primal Bound       : +9.00000000000000e+00 (1 solutions)
Dual Bound         : +9.00000000000000e+00
Gap                : 0.00 %
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 478 upgd conss, 0 impls, 579 clqs
(round 2, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 20 chg coeffs, 478 upgd conss, 0 impls, 579 clqs
   (0.0s) probing cycle finished: starting next cycle
(round 3, exhaustive) 2 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 20 chg coeffs, 478 upgd conss, 0 impls, 1663 clqs
(round 4, fast)       2 del vars, 42 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 20 chg coeffs, 478 upgd conss, 0 impls, 1663 clqs
   (0.1s) probing cycle finished: starting next cycle
   (0.1s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.1s) symmetry computation finished: 2 generators found (max: 1500, log10 of symmetry group size: 0.0) (symcode time: 0.00)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:         no components
   lexicographic reduction:    2 permutations with support sizes 40, 40
handled 2 out of 2 symmetry components
presolving (5 rounds: 5 fast, 4 medium, 4 exhaustive):
 2 deleted vars, 42 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 20 changed coefficients
 0 implications, 1756 cliques
presolved problem has 418 variables (418 bin, 0 int, 0 impl, 0 cont) and 436 constraints
     39 constraints of type <knapsack>
    397 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.06

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
  0.1s|     1 |     0 |   839 |     - |    10M |   0 | 418 | 518 | 436 |   0 |  0 |  82 |   0 | 8.280000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1109 |     - |    10M |   0 | 418 | 518 | 361 |   0 |  0 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1160 |     - |    10M |   0 | 418 | 643 | 303 |   8 |  1 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1175 |     - |    11M |   0 | 418 | 577 | 312 |  17 |  2 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1190 |     - |    13M |   0 | 418 | 577 | 319 |  24 |  3 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1220 |     - |    15M |   0 | 418 | 577 | 327 |  32 |  4 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.1s|     1 |     0 |  1244 |     - |    19M |   0 | 418 | 577 | 336 |  41 |  5 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1265 |     - |    23M |   0 | 418 | 577 | 344 |  49 |  6 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1299 |     - |    25M |   0 | 418 | 577 | 350 |  55 |  7 |  82 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1339 |     - |    29M |   0 | 418 | 578 | 354 |  59 |  8 |  83 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1376 |     - |    32M |   0 | 418 | 578 | 359 |  64 |  9 |  83 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1403 |     - |    37M |   0 | 418 | 579 | 364 |  69 | 10 |  84 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.2s|     1 |     0 |  1445 |     - |    37M |   0 | 418 | 579 | 365 |  77 | 11 |  84 |   0 | 9.000000e+00 |      --      |    Inf | unknown
  0.3s|     1 |     2 |  1881 |     - |    37M |   0 | 418 | 580 | 365 |  77 | 11 |  91 |  11 | 9.000000e+00 |      --      |    Inf | unknown
* 0.3s|     6 |     0 |  1935 |  98.0 |    LP  |   5 | 418 | 580 | 318 |  77 |  0 |  91 |  11 | 9.000000e+00 | 9.000000e+00 |   0.00%|  98.85%

SCIP Status        : problem is solved [optimal solution found]
Solving Time (sec) : 0.28
Solving Nodes      : 6
Primal Bound       : +9.00000000000000e+00 (1 solutions)
Dual Bound         : +9.00000000000000e+00
Gap                : 0.00 %
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 3720 upgd conss, 0 impls, 3960 clqs
   (0.1s) probing: 51/3660 (1.4%) - 0 fixings, 0 aggregations, 0 implications, 0 bound changes
   (0.1s) probing aborted: 50/50 successive totally useless probings
   (0.1s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.1s) symmetry computation finished: 73 generators found (max: 1500, log10 of symmetry group size: 80.0) (symcode time: 0.05)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:          1 components of sizes 73
   lexicographic reduction:   73 permutations with support sizes 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122
handled 1 out of 1 symmetry components
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 60 changed coefficients
 0 implications, 3960 cliques
presolved problem has 3660 variables (3660 bin, 0 int, 0 impl, 0 cont) and 3720 constraints
     60 constraints of type <knapsack>
   3660 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.12

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
p 0.1s|     1 |     0 |     0 |     - |  clique|   0 |3660 |3720 |3720 |   0 |  0 |   0 |   0 | 0.000000e+00 | 1.500000e+01 |    Inf | unknown
p 0.2s|     1 |     0 |   355 |     - | vbounds|   0 |3660 |3722 |3720 |   0 |  0 |  12 |   0 | 0.000000e+00 | 1.400000e+01 |    Inf | unknown
  1.0s|     1 |     0 |  9142 |     - |    76M |   0 |3660 |3815 |3720 |   0 |  0 | 105 |   0 | 1.400000e+01 | 1.400000e+01 |   0.00%| unknown

SCIP Status        : problem is solved [optimal solution found]
Solving Time (sec) : 1.00
Solving Nodes      : 1
Primal Bound       : +1.40000000000000e+01 (2 solutions)
Dual Bound         : +1.40000000000000e+01
Gap                : 0.00 %
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 3838 upgd conss, 0 impls, 4019 clqs
   (0.2s) probing: 110/3660 (3.0%) - 2 fixings, 0 aggregations, 101979 implications, 0 bound changes
   (0.2s) probing aborted: 50/50 successive totally useless probings
   (0.2s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.2s) symmetry computation finished: 14 generators found (max: 1500, log10 of symmetry group size: 0.0) (symcode time: 0.00)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:         no components
   lexicographic reduction:   14 permutations with support sizes 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120
handled 14 out of 14 symmetry components
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 2 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 60 changed coefficients
 0 implications, 19567 cliques
presolved problem has 3658 variables (3658 bin, 0 int, 0 impl, 0 cont) and 3838 constraints
    119 constraints of type <knapsack>
   3719 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.18

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
  1.4s|     1 |     0 | 12507 |     - |    84M |   0 |3658 |3866 |3716 |   0 |  0 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  1.6s|     1 |     0 | 14061 |     - |    84M |   0 |3658 |3866 |3601 |   0 |  0 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  1.7s|     1 |     0 | 14392 |     - |    87M |   0 |3658 |3751 |3206 |  19 |  1 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  1.8s|     1 |     0 | 14534 |     - |    88M |   0 |3658 |3330 |3243 |  56 |  2 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  1.9s|     1 |     0 | 14728 |     - |    91M |   0 |3658 |3328 |3263 |  76 |  3 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.0s|     1 |     0 | 14914 |     - |    92M |   0 |3658 |3328 |3291 | 104 |  4 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.0s|     1 |     0 | 15028 |     - |    93M |   0 |3658 |3326 |3314 | 127 |  5 | 155 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.1s|     1 |     0 | 15139 |     - |    93M |   0 |3658 |3331 |3336 | 149 |  6 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.2s|     1 |     0 | 15243 |     - |    94M |   0 |3658 |3331 |3359 | 172 |  7 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.2s|     1 |     0 | 15334 |     - |    95M |   0 |3658 |3331 |3385 | 198 |  8 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.3s|     1 |     0 | 15448 |     - |    96M |   0 |3658 |3331 |3408 | 221 |  9 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.4s|     1 |     0 | 15823 |     - |    96M |   0 |3658 |3328 |3432 | 245 | 10 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.5s|     1 |     0 | 16843 |     - |    98M |   0 |3658 |3327 |3459 | 272 | 11 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
  2.6s|     1 |     0 | 17065 |     - |    99M |   0 |3658 |3327 |3481 | 294 | 12 | 160 |   0 | 1.390000e+01 |      --      |    Inf | unknown
pressed CTRL-C 1 times (5 times for forcing termination)
  3.1s|     1 |     2 | 18088 |     - |    99M |   0 |3658 |3308 |3481 | 294 | 12 | 163 |   6 | 1.390000e+01 |      --      |    Inf | unknown

SCIP Status        : solving was interrupted [user interrupt]
Solving Time (sec) : 3.08
Solving Nodes      : 1
Primal Bound       : +1.00000000000000e+20 (0 solutions)
Dual Bound         : +1.39000000000000e+01
Gap                : infinite
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 3720 upgd conss, 0 impls, 4620 clqs
   (0.1s) probing: 51/3660 (1.4%) - 0 fixings, 0 aggregations, 0 implications, 0 bound changes
   (0.1s) probing aborted: 50/50 successive totally useless probings
   (0.1s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.1s) symmetry computation finished: 80 generators found (max: 1500, log10 of symmetry group size: 80.0) (symcode time: 0.06)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:          1 components of sizes 80
   lexicographic reduction:   80 permutations with support sizes 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 120, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122
handled 1 out of 1 symmetry components
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 60 changed coefficients
 0 implications, 4620 cliques
presolved problem has 3660 variables (3660 bin, 0 int, 0 impl, 0 cont) and 3720 constraints
     60 constraints of type <knapsack>
   3660 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.12

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
p 0.1s|     1 |     0 |     0 |     - |  clique|   0 |3660 |3720 |3720 |   0 |  0 |   0 |   0 | 0.000000e+00 | 2.700000e+01 |    Inf | unknown
  0.8s|     1 |     0 |  7956 |     - |    74M |   0 |3660 |3796 |3720 |   0 |  0 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
  0.9s|     1 |     0 |  8132 |     - |    78M |   0 |3660 |3796 |3746 |  26 |  1 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
  1.0s|     1 |     0 |  8334 |     - |    79M |   0 |3660 |3796 |3775 |  55 |  2 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
  1.0s|     1 |     0 |  8525 |     - |    83M |   0 |3660 |3796 |3807 |  87 |  3 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
  1.1s|     1 |     0 |  8627 |     - |    86M |   0 |3660 |3796 |3835 | 115 |  4 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
  1.1s|     1 |     0 |  8864 |     - |    87M |   0 |3660 |3796 |3862 | 142 |  5 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown
pressed CTRL-C 1 times (5 times for forcing termination)
  1.2s|     1 |     0 |  9353 |     - |    88M |   0 |3660 |3796 |3889 | 169 |  6 |  76 |   0 | 2.544000e+01 | 2.700000e+01 |   6.13%| unknown

SCIP Status        : solving was interrupted [user interrupt]
Solving Time (sec) : 1.21
Solving Nodes      : 1
Primal Bound       : +2.70000000000000e+01 (1 solutions)
Dual Bound         : +2.54400000000000e+01
Gap                : 6.13 %
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 3838 upgd conss, 0 impls, 4679 clqs
pressed CTRL-C 1 times (5 times for forcing termination)
   (0.1s) probing: 59/3660 (1.6%) - 1 fixings, 0 aggregations, 100751 implications, 0 bound changes
   (0.1s) probing aborted: solving stopped
presolving (2 rounds: 2 fast, 2 medium, 2 exhaustive):
 2 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 60 changed coefficients
 0 implications, 13813 cliques
presolving was interrupted.
Presolving Time: 0.14

SCIP Status        : solving was interrupted [user interrupt]
Solving Time (sec) : 0.14
Solving Nodes      : 0
Primal Bound       : +1.00000000000000e+20 (0 solutions)
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 1680 upgd conss, 0 impls, 2160 clqs
(round 2, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 40 chg coeffs, 1680 upgd conss, 0 impls, 2160 clqs
   (0.0s) probing: 51/1640 (3.1%) - 0 fixings, 0 aggregations, 0 implications, 0 bound changes
   (0.0s) probing aborted: 50/50 successive totally useless probings
   (0.0s) symmetry computation started: requiring (bin +, int +, cont +), (fixed: bin -, int -, cont -)
   (0.0s) symmetry computation finished: 50 generators found (max: 1500, log10 of symmetry group size: 50.0) (symcode time: 0.01)
dynamic symmetry handling statistics:
   orbitopal reduction:       no components
   orbital reduction:          1 components of sizes 50
   lexicographic reduction:   50 permutations with support sizes 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 80, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82
handled 1 out of 1 symmetry components
presolving (3 rounds: 3 fast, 3 medium, 3 exhaustive):
 0 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 40 changed coefficients
 0 implications, 2400 cliques
presolved problem has 1640 variables (1640 bin, 0 int, 0 impl, 0 cont) and 1680 constraints
     40 constraints of type <knapsack>
   1640 constraints of type <setppc>
transformed objective value is always integral (scale: 1)
Presolving Time: 0.04

 time | node  | left  |LP iter|LP it/n|mem/heur|mdpt |vars |cons |rows |cuts |sepa|confs|strbr|  dualbound   | primalbound  |  gap   | compl. 
p 0.0s|     1 |     0 |     0 |     - |  clique|   0 |1640 |1680 |1680 |   0 |  0 |   0 |   0 | 0.000000e+00 | 1.800000e+01 |    Inf | unknown
pressed CTRL-C 1 times (5 times for forcing termination)

SCIP Status        : solving was interrupted [user interrupt]
Solving Time (sec) : 0.17
Solving Nodes      : 1
Primal Bound       : +1.80000000000000e+01 (1 solutions)
Dual Bound         : +0.00000000000000e+00
Gap                : infinite
presolving:
(round 1, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 0 chg coeffs, 1758 upgd conss, 0 impls, 2199 clqs
(round 2, exhaustive) 0 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 40 chg coeffs, 1758 upgd conss, 0 impls, 2199 clqs
pressed CTRL-C 1 times (5 times for forcing termination)
   (0.2s) probing: 638/1640 (38.9%) - 2 fixings, 0 aggregations, 38117 implications, 0 bound changes
   (0.2s) probing aborted: solving stopped
(round 3, exhaustive) 2 del vars, 0 del conss, 0 add conss, 0 chg bounds, 0 chg sides, 40 chg coeffs, 1758 upgd conss, 0 impls, 6173 clqs
presolving (3 rounds: 3 fast, 3 medium, 3 exhaustive):
 2 deleted vars, 0 deleted constraints, 0 added constraints, 0 tightened bounds, 0 added holes, 0 changed sides, 40 changed coefficients
 0 implications, 6173 cliques
presolving was interrupted.
Presolving Time: 0.17

SCIP Status        : solving was interrupted [user interrupt]
Solving Time (sec) : 0.17
Solving Nodes      : 0
Primal Bound       : +1.00000000000000e+20 (0 solutions)
=========== [start] SOLVE THE u120_00.bpa LINEAR PROGRAM [start] ===========
-----------Solver Start--------
-----------Solver End--------
The solver reached the time limit for u120_00.bpa. Moving to the next file.
-----------Solver Start--------
-----------Solver End--------
The solver reached the time limit for u120_00.bpa. Moving to the next file.
=========== [finish] SOLVE THE u120_00.bpa LINEAR PROGRAM [finish] ===========
=========== [start] SOLVE THE u20_00.bpa LINEAR PROGRAM [start] ===========
-----------Solver Start--------
-----------Solver End--------
-----------Solver Start--------
-----------Solver End--------
=========== [finish] SOLVE THE u20_00.bpa LINEAR PROGRAM [finish] ===========
=========== [start] SOLVE THE inst60-non-unif_9.bpa LINEAR PROGRAM [start] ===========
-----------Solver Start--------
-----------Solver End--------
-----------Solver Start--------
-----------Solver End--------
Stopped due to infeasibility or other status.
=========== [finish] SOLVE THE inst60-non-unif_9.bpa LINEAR PROGRAM [finish] ===========
=========== [start] SOLVE THE u60_00.bpa LINEAR PROGRAM [start] ===========
-----------Solver Start--------
-----------Solver End--------
Stopped due to infeasibility or other status.
-----------Solver Start--------
-----------Solver End--------
Stopped due to infeasibility or other status.
=========== [finish] SOLVE THE u60_00.bpa LINEAR PROGRAM [finish] ===========
=========== [start] SOLVE THE u40_00.bpa LINEAR PROGRAM [start] ===========
-----------Solver Start--------
-----------Solver End--------
Stopped due to infeasibility or other status.
-----------Solver Start--------
-----------Solver End--------
Stopped due to infeasibility or other status.
=========== [finish] SOLVE THE u40_00.bpa LINEAR PROGRAM [finish] ===========
| File Name                      | Nb Boites | Temps sans gestion symétries   | Temps avec gestion symétries   |
|--------------------------------|-----------|--------------------------------|--------------------------------|
| u120_00.bpa                    | ?         | (time limit)                   | (time limit)                   |
| u20_00.bpa                     | 9.0       | 0.029251                       | 0.27683199999999997            |
| inst60-non-unif_9.bpa          | 14.0      | 1.004198                       | (some limit)                   |
| u60_00.bpa                     |  ?        | (some limit)                   | (some limit)                   |
| u40_00.bpa                     |  ?        | (some limit)                   | (some limit)                   |
