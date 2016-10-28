# USU STAT 2300 Module 4.2
Camille Fairbourn  

#Module 4, Part 2: Sampling Distributions

##Sampling Distributions for the Mean

As mentioned previously, each time you open a new RStudio session, you need to run the following three commands.


```r
require(mosaic)
require(openintro)
require(MASS)
```

The U.S. Department of Education hosts a [website](https://collegescorecard.ed.gov/data/) where they make available data about all undergraduate degree-granting institutions of higher education in the United States. In this exercise, we will work with a sample of 506 public universities and their recorded information from the year 2013.

First, we read in the dataset and construct a density histogram of the average yearly cost of attendance. We will also calculate and plot a vertical line at the mean of this variable.

```r
collegecost<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/collegecost.csv")

hist(collegecost$yearly,
     main = "Public Universities in the United States, 2013",
     xlab = "Average yearly cost of attendance in $",
     prob = TRUE)
abline(v = mean(collegecost$yearly), col = "red", lwd = 3)
```

![](Module04-2_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
mean(collegecost$yearly)
```

```
## [1] 19719.76
```

Let's take a simple random sample of 5 of these universities and store the results in a vector called x. We will also calculate the mean for the sample.


```r
x<-sample(collegecost$yearly, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
## [1] 15313 20762 18466 19511 16107
```

```r
mean(x) #this sample mean
```

```
## [1] 18031.8
```

```r
#Now take a simple random sample of 20 of these trucks and
#store the results in a vector called x.
x<-sample(collegecost$yearly, 20)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
##  [1] 18088 17578 12946 17742 21203 17738 22273 14858 17873 22311 23673
## [12] 27781 25786 20916 26970 19105 18054 19192 17758 31803
```

```r
mean(x) #this sample mean
```

```
## [1] 20682.4
```

```r
#Re-run lines 34 through 37 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.

#Now take a simple random sample of 50 of these trucks and
#store the results in a vector called x.
x<-sample(collegecost$yearly, 50)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
##  [1] 20449 20234 23995 18192 20531 15207 22041 17892 20282 19402 21980
## [12] 20762 20899 15753 17578 18285 20846 20799 16782 18466 19843 25248
## [23] 16707 17290 15402 24278 20386 30637 17093 19511 19873 21960 29751
## [34] 19900 16397 19048 19990 22861 22332 23685 24746 16377 13180 19761
## [45] 19468 17709 19965 20372 17029 18628
```

```r
mean(x) #this sample mean
```

```
## [1] 19996.04
```
