# Variogram models

This far, we used *experimental* variograms, which are derived from observed data 
to detect spatial structures in the data. This is already insightful, but if we 
want to utilize these functions for an interpolation we have to go one step further.
We need to fit an **theoretical variogram function**, or variogram model to our 
data, that describes the covariance structure in a more mathematical notation.
This can be done by any means suitable to fit a function to data. Most common 
approaches are least squares or maximum likelihood estimation. 

## Task 1

To get things started, calculate an experimental variogram for the given 
artificial data in `artificial.csv`, just like you did in in Task 6 of the previous
exercise. Adjust the binning until you're happy with the vaiogram.  Estimate the 
three variogram parameters nugget, sill and effective range by visual inspection 
and note them down. We will need these values later.

## Task 2

The most common variogram model functions are: 

* spherical model
* exponential model
* Gaussian model

Implement each one as a Matlab/Octave function and use the *test_* scripts for 
development. The definitions of the models can be found below

### Spherical model

![spherical variogram model](spherical.svg)

### Exponential model

![exponential variogram model](http://latex.codecogs.com/svg.latex?\gamma%20=%20b%20+%20C_0%20*%20\left({1%20-%20e^{-\frac{h}{a}}}\right))

### Gaussian model

![gaussian variogram model](http://latex.codecogs.com/svg.latex?\gamma%20=%20b%20+%20c_0%20*%20\left({1%20-%20e^{-\frac{h^2}{a^2}}}\right))

### Range vs effective range

Remember the difference between the model parameter *range*, denoted as **a** here, 
and the effective range of the variogram (and the data) itself *r*. As you know from the
lectures, a := r for a spherical, a := r/3 for a exponential, and a := r/2 for a Gaussian
model.

## Task 3

Time for action. Apply each of the three models using different colors to your 
experimental variogram from Task 1. Use the parameters derived in that task 
as function arguments. How do the three models differ?

## Task 4

Can you find better / other parameters for the three models by 
trial-and-error fitting? Copy your best guess for variogram parameters for each 
of the model into one table.

## Task 5

Use the build-in Matlab / Octave least-squares function to find the best 
variogram parameter set for each of the functions. Plot the fitted models as they 
are your ultimate result. 
How much do they differ from  your best guess? Did the machine beat you?


