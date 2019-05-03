# Univariate statistics

This exercise is a short collection of important metrics, concepts and tools
needed to dive into geostatistics. 

*Note:* These tasks are most fun when you split up into two groups and run 
task 2 against the code of the other group.

## Task 1

Matlab/Octave are great as they offer a lot of pre-built functions. Especially 
for statistics. Calculating a arithmetric mean, standard deviation, variance and 
a histogram of the sample stored in an array `x` is as easy as:

```Matlab
mean(x)
std(x)
var(x)
histcounts(x, 25)
```

But what have you actually done? Do you know that? What is the variance or mean?
Easy? Then reprogramm it.
There are 4 files with a prepared function. Remove the call to the generic
Octave function with your own code.

## Task 2

Now it's time to write your own unit test. You produced 4 functions in task 1. 
Now fill the `test.m` file. After running this file one has to be sure that your 
code is running properly and there is no way to break it by misusage.
Look into the [idw folder](https://github.com/KIT-HYD/geostatistics_lecture/tree/master/idw) 
`test_file.m` if you need some inspiration 
(But note, that this file does not test everything).

How should a unit test be designed? Well, that's a long story and you can buy 
books about it. We'll keep it simple. Answer yourself these questions and program
the `test.m` accordingly:

* Create defined input.
* What is the expected outcome of a function using this input?
* Test it.
* Is there more than one option, how the code can be run? Well, then you need more
  than one test...
* Now, think of a stupid user. What could go wrong? Test against it.


 