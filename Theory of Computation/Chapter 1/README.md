# 1 - Regular Languages

## Exercises 

### 1.1

- a. What is the start state?
  - $q_1$ for $M_1$.
  - $q_1$ for $M_2$.
- b. What is the set of accept states?
  - $\{ q_2 \}$ for $M_1$ 
  - $\{q_2=1, q_4\}$ for $M_2$
- c. What sequence of states does the machine go through on input aabb?
  - For $M_1$
    - $q_1 \to q_2 \to q_3 \to q_1 \to q_1$
  - For $M_2$
    - $q_1 \to q_1 \to q_1 \to q_2 \to q_4$
- d. Does the machine accept the string aabb?
  - $M_1$ does not.
  - $M_2$ does.
- e. Does the machine accept the string ε?
  - $M_1$ does not.
  - $M_2$ does.

### 1.2

- $M_1 = \{ \{q_1, q_2, q_3\}, \{a, b\}, \delta_1, q_1, \{q_2\} \}$

  - $\delta_1$

    |       | $a$   | $b$   |
    | ----- | ----- | ----- |
    | $q_1$ | $q_2$ | $q_1$ |
    | $q_2$ | $q_3$ | $q_3$ |
    | $q_3$ | $q_2$ | $q_1$ |

    

- $M_2 = \{ \{q_1, q_2, q_3, q_4\}, \{a, b\}, \delta_2, q_1, \{q_1, q_4\} \}$

  - $\delta_2$

    |       | $a$   | $b$   |
    | ----- | ----- | ----- |
    | $q_1$ | $q_1$ | $q_2$ |
    | $q_2$ | $q_3$ | $q_4$ |
    | $q_3$ | $q_2$ | $q_1$ |
    | $q_4$ | $q_3$ | $q_4$ |

### 1.3

```
   _u_   u        u            u        u  _d_
   ↓ | <---     <--- _______ <---     <--- ↓ |
-> q_1 ---> q_2 ---> | q_3 | ---> q_4 ---> q_5
        d        d   -------  d        d
```

### 1.4

We use the same idea for union, but changing $F$.

Let $M_1$ recognize $A_1$, where $M_1 = (Q_1, Σ, δ_1, q_1, F_1)$, and $M_2$ recognize $A_2$, where $M_2 = (Q_2, Σ, δ_2, q_2, F_2)$. 

Construct $M$ to recognize $A_1 \cap A_2$, where $M = (Q, Σ, δ, q_0, F)$.

1. $Q = \{(r_1, r_2)| r_1 ∈ Q_1 \text{ and } r_2 ∈ Q_2\}$.
2.  For each $(r_1, r_2) ∈ Q$ and each $a ∈ Σ$, let $δ (r_1, r_2), a = δ1(r_1, a), δ2(r_2, a)$.
3. $q_0$ is the pair $(q_1, q_2)$.
4. $F = F_1 \times F_2$.

##### a. $\{ w| w \text{ has at least three a’s and at least two b’s}\}$

$M_1 = \{ \{q_1, q_2, q_3, q_4\}, \{a, b\}, \delta_1, q_1, \{q_4\} \}$

$\delta_1$

|       | $a$   | $b$   |
| ----- | ----- | ----- |
| $q_1$ | $q_2$ | $q_1$ |
| $q_2$ | $q_3$ | $q_2$ |
| $q_3$ | $q_4$ | $q_3$ |
| $q_4$ | $q_4$ | $q_4$ |

$M_2 = \{ \{q_5, q_6, q_7\}, \{a, b\}, \delta_2, q_5, \{q_7\} \}$

$\delta_1$

|       | $a$   | $b$   |
| ----- | ----- | ----- |
| $q_5$ | $q_5$ | $q_6$ |
| $q_6$ | $q_6$ | $q_7$ |
| $q_7$ | $q_7$ | $q_7$ |

$\{ w| M_1 \cap M_2 \} = Q, \{a, b\}, \delta, (q_1, q_5), \{(q_4, q_7\} \}$$

$\delta$

| Q            | $a$          | $b$          |
| ------------ | ------------ | ------------ |
| $(q_1, q_5)$ | $(q_2, q_5)$ | $(q_1, q_6)$ |
| $(q_1, q_6)$ | $(q_2, q_6)$ | $(q_1, q_7)$ |
| $(q_1, q_7)$ | $(q_2, q_7)$ | $(q_1, q_7)$ |
| $(q_2, q_5)$ | $(q_3, q_5)$ | $(q_2, q_6)$ |
| $(q_2, q_6)$ | $(q_3, q_6)$ | $(q_2, q_7)$ |
| $(q_2, q_7)$ | $(q_3, q_7)$ | $(q_2, q_7)$ |
| $(q_3, q_5)$ | $(q_4, q_5)$ | $(q_3, q_6)$ |
| $(q_3, q_6)$ | $(q_4, q_6)$ | $(q_3, q_7)$ |
| $(q_3, q_7)$ | $(q_4, q_7)$ | $(q_3, q_7)$ |
| $(q_4, q_5)$ | $(q_4, q_5)$ | $(q_4, q_6)$ |
| $(q_4, q_6)$ | $(q_4, q_6)$ | $(q_4, q_7)$ |
| $(q_4, q_7)$ | $(q_4, q_7)$ | $(q_4, q_7)$ |



#####  b. $\{w| w \text{ has exactly two a’s and at least two b’s}\}$

##### c. $\{w| w \text{ has an even number of a’s and one or two b’s}\}$

##### d. $\{w| w \text{ has an even number of a’s and each a is followed by at least one b}\}$

##### e. $\{w| w \text{ starts with an a and has at most one b}\}$

##### f. $\{w| w \text{ has an odd number of a’s and ends with a b}\}$

##### g. $\{w| w \text{ has even length and an odd number of a’s}\}$

### 1.5

### 1.6

### 1.7

### 1.8

### 1.9

### 1.10

### 1.11

### 1.12

### 1.13

### 1.14

### 1.15

### 1.16

### 1.17

### 1.18

### 1.19

### 1.20

### 1.21

### 1.22

### 1.23

### 1.24

### 1.25

### 1.26

### 1.27

### 1.28

### 1.29

### 1.30

## Problems

### 1.31

### 1.32

### 1.33

### 1.34

### 1.35

### 1.36

### 1.37

### 1.38

### 1.39

### 1.40

### 1.41

### 1.42

### 1.43

### 1.44

### 1.45

### 1.46

### 1.47

### 1.48

### 1.49

### 1.50

### 1.51

### 1.52

### 1.53

### 1.54

### 1.55

### 1.56

### 1.57

### 1.58

### 1.59

### 1.60

### 1.61

### 1.62

### 1.63

### 1.64

### 1.65

### 1.66

### 1.67

### 1.68

### 1.69

### 1.70

### 1.71

### 1.72

### 1.73
