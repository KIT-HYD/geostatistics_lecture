# Project 5: Spatio-Temporal Geostatistics

| group size |     > 3         |
|------------|-----------------|
| difficulty |     hard        |
| material   | https://github.com/KIT-HYD/geostatistics_lecture/tree/master/lectures/data |

## Description

Use the `sample_positions.txt` and `sample_data.txt` from the folder given above.
Use the code from the lectures to implement a spatio-temporal variogram and model.

You can decrease the number of time-steps used to implement the algorithm. Use a kriging
to reconstruct either fields at a (not used) time step or fill the gaps in the time series
using kriging. Plot the results and describe.

For this project it is important to keep things simple. Define how the spatio-temporal 
variogram, theoretical model and kriging differ from the spatial counterpart. 
Can you break the differences down to that instead of `y(h)` you will always pass `y(h, t)`? 
If yes, you can define an *interface* and split up into sub-groups working on the 
variogram, model and kriging.

## Literature

Check out: *Spatial and Spatio-Temporal Geostatistical Modeling and Kriging* by Montero, Fernández-Avilés and Mateu; ISBN: 9781118413180

The important stuff is available on google books. The Library has a copy, and I have one as well.

also helpful:

* https://doi.org/10.1016/S0167-7152(00)00131-0
* https://doi.org/10.1016/S0098-3004(01)00040-1
* https://doi.org/10.1023/A:1021368723926
