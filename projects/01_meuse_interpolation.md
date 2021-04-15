# Project 1: Apply Interpolation

| group size | individual work |
|------------|-----------------|
| difficulty | really easy     |
| material   | meuse data      |

## Description

Use the `meuse` dataset to perform a kriging interpolation of the contaminants. There are measurements of 
cadmium, copper, lead and zinc. 
Work the following questions into your final report:

* Which of the contaminants shows an apparent spatial structure?
* Is it different for the different contaminant?
* Where do you expect Ordinary Kriging to work well, where not?

You also have elevation data (elev) and landuse data available. Check each of the contaminants for 
correlation. After plotting or testing, do you expect either elevation or landuse to be a good prior 
for estimating the contaminants?

## Data

The `meuse` dataset is a commonly used geostatistical benchmark dataset that can be used to learn 
geostatistics and test developments. It is quite easy to load it in R as it is part of the `sp` package:

```R
install.packages("sp")
library(sp)
data(meuse)
```

Then, you can solve the project in R or save the data to CSV and open it in Matlab/Python.
