# Shortest Paths Revisited, NP-Complete Problems and What To Do About Them

## Books Problems

1. [Unit 18](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/problems-unit-18.md)
2. [Unit 19](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/problems-unit-19.md)
3. [Unit 20](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/problems-unit-20.md)
4. [Unit 21](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/problems-unit-21.md)

## Algorithms

1. **Unit 18**
   1. [`Heap`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/DynamicShortestPathAlgorithms/Heap.rb)
   2. [`Dijkstra`, `Floyd-Warshall`, and `Bellman-Ford`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/DynamicShortestPathAlgorithms/DynamicShortestPathAlgorithms.rb)
   3. [`ShortestShortestPath`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/DynamicShortestPathAlgorithms/ShortestShortestPath.rb)
2. **Unit 19**
   1. [`ExhaustiveSearchTSP`](https://github.com/gpm22/ossu-projects/tree/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/ExhaustiveSearchTSP)
3. **Unit 20**
   1. [`NearestNeighborTSP`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/EfficientInexactTSP/NearestNeighborTSP.rb)
   2. [`TSP2OPT`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/EfficientInexactTSP/TSP2OPT.rb)
4. **Unit 21**
   1. [`BellmanHeldKarp`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/ExactInefficientTSP/BellmanHeldKarp.rb)
   2. [`LPMaker`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/ExactInefficientTSP/LPMaker.rb)
      * Creates LP files for TSP problem from graph instances.
      * The script [`instance_maker`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/ExactInefficientTSP/instance_maker.rb) receives parameters from command line and creates the LP file using this class. 
   3. [`MIPSolvers`](https://github.com/gpm22/ossu-projects/blob/main/Shortest%20Paths%20Revisited%2C%20NP-Complete%20Problems%20and%20What%20To%20Do%20About%20Them/ExactInefficientTSP/MIPSolvers.rb)
      * Solves LP files created from graph instances using the MIP solvers GLPK and SCIP.

