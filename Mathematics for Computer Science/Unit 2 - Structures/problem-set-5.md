# Problem Set 5

Questions are available on [**MIT**](https://openlearninglibrary.mit.edu/assets/courseware/v1/f472b410ecb65c7a0ed180b2a8bbd5cb/asset-v1:OCW+6.042J+2T2019+type@asset+block/MIT6_042JS15_ps5.pdf).

## Problem 1

Extend the binary gcd procedure to obtain a new pulverizer that uses only division by 2 and subtraction in the course textbook.

**Binary GCD state machine:**
$$
\text{states} & ::= & \N^3 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
\text{variables} & ::= & (x, y, e) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
\text{start state} & ::= & (a, b, 1) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \\
\text{transitions} & ::= & \text{if min}(x, y) > 0, \text{ then } (x, y, e) \to \\
& & (x/2, y/2, 2e) & \quad (\text{if }2|x \text{ and } 2 | y) & \quad (2) \\
& & (x/2, y, e) & \quad (\text{else if }2|x) & \quad (3) \\
& & (x, y/2, e) & \quad (\text{else if }2|y) & \quad (4) \\
& & (x-y, y, e) & \quad (\text{else if }x>y) & \quad (5) \\
& & (y-x, x, e) & \quad (\text{else if }y>x) & \quad (6) \\
& & (1, 0, ex) & \quad (\text{otherwise } (x=y)) & \quad (7) \\
\text{invariant} & ::= & \text{gcd}(x,y)e = \text{gcd}(a,b) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ 
$$

**Binary Pulverizer state machine:**
$$
\text{states} & ::= & \N^7 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{variables} & ::= & (x, y, e, u_x, v_x, u_y, v_y) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{start state} & ::= & (a, b, 1, 1, 0, 0, 1) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \\
\text{transitions} & ::= & \text{if min}(x, y) > 0, \text{ then } (x, y, e, u_x, v_x, u_y, v_y) \to \\
& & (x/2, y/2, 2e) & \quad (\text{if }2|x \text{ and } 2 | y) & \quad (2) \\
& & (x/2, y, e) & \quad (\text{else if }2|x) & \quad (3) \\
& & (x, y/2, e) & \quad (\text{else if }2|y) & \quad (4) \\
& & (x-y, y, e) & \quad (\text{else if }x>y) & \quad (5) \\
& & (y-x, x, e) & \quad (\text{else if }y>x) & \quad (6) \\
& & (1, 0, ex) & \quad (\text{otherwise } (x=y)) & \quad (7) \\
\text{invariants} & ::= & \text{gcd}(x,y)e = \text{gcd}(a,b) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
& & u_xa + v_xb = x \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \\
& & u_ya + v_yb = y \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
$$


## Problem 2

## Problem 3

