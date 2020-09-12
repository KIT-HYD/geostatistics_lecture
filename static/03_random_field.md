# Project 3: Random Fields

| group size | 1 - 3 persons   |
|------------|-----------------|
| difficulty | medium          |
| material   | https://github.com/KIT-HYD/geostatistics_lecture/tree/master/lectures/data  |

## Description

**Note:** For this exercise you will need to automate the algorithm. Thus, some basic programming skills are necessary.

Use the `sample_positions.txt` and `sample_data.txt` from the folder given above.
In lecture we used the postitions with the observations at first time stepto implement a kriging algorithm. 
The objective of this project is to implement and test a objective function. 

We have the original field available and can easily test it pixel by pixel against the 
interpolation result (in the `field3d` folder as whitespace separated matrices). 
But is that really smart? Your objective is to implement a smart validation 
function to assess the kriging performance and test it on the other fields. While thinking about 
validation keep these questions in mind:

* is it surprising, that estimations close to observations are better?
* do we want to estimate a little bit better close to observations at the cost of being far off at distant points?
* are we interested in the areas covered by a lot or only little observations?
* do we expect the variogram to change in time?


Work the following questions into your report:

* Once you validated the first random field, also used in lecture - how does the **same** variogram perform on the other fields?
* Compare autocorrelation plots of the sample timeseries introduced in lecture to a performance ~ time plot of the kriging.

**Note:** To decrease the processing times, you can use only every 5th or 10th time step.
