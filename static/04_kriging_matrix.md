# Project 4: Tweak the kriging matrix

| group size | individual work |
|------------|-----------------|
| difficulty | medium          |
| material   | -               |

## Description

In class, we build the kriging matrix by:

1. modelling the semi-variance for each of the neighboring points
2. appending a row and a column for the lagrange multipliers
3. calculating the result matrix for the equation system

This is a lot of unnecessary calculations. Implement an alternative kriging algorithm 
that is more performant. Achieve the performance gain only on the algorithmic part of 
kriging (just parallizing or compiled implementation is not fulfilling this project).

### Implementation A
Instead of calculating the semi-variances between points in every iteration, 
you can can calculate them once nad implement a smart algorithm to read the correct 
values from the precalculated semivariances into the kriging matrix.

## Implementation B
Another possibility is to estimate the variogram model. calculate it at a given resolution, eg. 
100 steps up to effective range. Then, as soon as a semi-variance modelling is needed just 
look up the closest value.

How do these two implementations compare against each other, how do they compare against the 
*exact* calculation given in class? Assess by calculation time and error. Maybe plot these two 
against each other. Is there an optimum? 
