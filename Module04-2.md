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
collegecost <- read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/collegecost.csv")

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
x <- sample(collegecost$yearly, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
## [1] 16782 19755 26970 29520 18028
```

```r
mean(x) #this sample mean
```

```
## [1] 22211
```

Run the code below 3 more times and make note of the mean of each sample


```r
x <- sample(collegecost$yearly, 5)
x
mean(x)
```

**Increase the sample size to n = 20**

Let's repeat this for a larger sample size. Make note of the mean of each sample.


```r
x <- sample(collegecost$yearly, 20)
x #data for this sample
```

```
##  [1] 16107 13204 21222 23130 18479 23675 20511 19202 18581 25416 19829
## [12] 22387 19299 16126 23995 21420 20404 16427 22041 19178
```

```r
mean(x) #this sample mean
```

```
## [1] 20031.65
```

Run the code below 3 more times and make note of the mean of each sample


```r
x <- sample(collegecost$yearly, 20)
x
mean(x)
```

**Increase the sample size to n = 50**

Repeat once more for an even larger sample size. Again, make a note of the mean of each sample.


```r
x <- sample(collegecost$yearly, 50)
x #data for this sample
```

```
##  [1] 19873 19048 17896 20916 21402 13756 20538 16020 25291 16071 19917
## [12] 21922 24375 16877 24746 21748 18028 17749 20372 23763 20630 20799
## [23] 23740 13735 19366 23263 13713 28943 13296 18033 21160 31803 21512
## [34] 17805 20840 21732 14925 19058 21971 21203 21990 16556 13026 19212
## [45] 19843 19145 27247 22974 17377 21401
```

```r
mean(x) #this sample mean
```

```
## [1] 20132.12
```

Run the code below 3 more times and make note of the mean of each sample


```r
x <- sample(collegecost$yearly, 50)
x
mean(x)
```

**Now we're going to have R take 500 samples of n = 5 universities and record the mean of each sample.**

Specify the sample size, n. Then create a vector to store the sample means and draw the samples.

```r
n <- 5
xbar = rep(0,500)
for(i in 1:500) {xbar[i] = mean(sample(collegecost$yearly, n))}
```

Calculate the mean of the 500 sample means and compare it to the population mean, then create a histogram of the 500 sample means with a line at the population mean.

```r
mean(xbar) #the mean of the sample means
```

```
## [1] 19824.16
```

```r
mean(collegecost$yearly) #the population mean
```

```
## [1] 19719.76
```

```r
hist(xbar, 
     prob = TRUE, 
     breaks = 12, 
     xlim = c(5000, 35000),
     main = paste("Sample Means with n = ", n),
     xlab = "Mean")
abline(v = mean(collegecost$yearly), col = "red", lwd = 2)
```

![](Module04-2_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

Compare the sample means histogram to the data histogram. What do they have in common? How are they different?

**Let's change the sample size to n = 20 and repeat.**

```r
n<-20
xbar = rep(0,500)
for(i in 1:500) {xbar[i] = mean(sample(collegecost$yearly, n))}

mean(xbar) #the mean of the sample means
```

```
## [1] 19635.93
```

```r
mean(collegecost$yearly) #the population mean
```

```
## [1] 19719.76
```

```r
hist(xbar, 
     prob = TRUE, 
     breaks = 12, 
     xlim = c(5000, 35000),
     main = paste("Sample Means with n = ", n),
     xlab = "Mean")
abline(v = mean(collegecost$yearly), col = "red", lwd = 2)
```

![](Module04-2_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

**Finally, let's change the sample size to n = 50 and repeat one last time.**

```r
n <- 50
xbar = rep(0,500)
for(i in 1:500) {xbar[i] = mean(sample(collegecost$yearly, n))}

mean(xbar) #the mean of the sample means
```

```
## [1] 19732.97
```

```r
mean(collegecost$yearly) #the population mean
```

```
## [1] 19719.76
```

```r
hist(xbar, 
     prob = TRUE, 
     breaks = 12, 
     xlim = c(5000, 35000),
     main = paste("Sample Means with n = ", n),
     xlab = "Mean")
abline(v = mean(collegecost$yearly), col = "red", lwd = 2)
```

![](Module04-2_files/figure-html/unnamed-chunk-12-1.png)<!-- -->
