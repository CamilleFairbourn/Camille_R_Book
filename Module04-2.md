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

datamean <- round(mean(collegecost$yearly), 2)
datamean
```

```
## [1] 19719.76
```

```r
hist(collegecost$yearly,
     main = "Public Universities in the United States, 2013",
     xlab = "Average yearly cost of attendance in $",
     prob = TRUE)
abline(v = datamean, col = "red", lwd = 3)
```

![](Module04-2_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

Let's take a simple random sample of 5 of these universities and store the results in a vector called x. We will also calculate the mean for the sample. Notice that if you run the same code on your computer, you will not get the same answer as is shown here. This is because R draws a new sample of 5 colleges each time you run the command.


```r
x <- sample(collegecost$yearly, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
## [1] 24827 15272 20762 26651 14478
```

```r
mean(x) #this sample mean
```

```
## [1] 20398
```

Run the code below 3 more times and make note of the mean of each sample. Then calculate the average of your sample means and compare the result to the true mean of 19719.76. 


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
##  [1] 22861 20140 18061 15414  8020 21628 14823 17873 22102 22461 22009
## [12] 22933 17892 22273 22185 25416 19202 23763 15066 17400
```

```r
mean(x) #this sample mean
```

```
## [1] 19576.1
```

Run the code below 3 more times and make note of the mean of each sample. Then calculate the average of your sample means and compare the result to the true mean of 19719.76. 


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
##  [1] 16753 18781 18852 25265 19851 20199 16935 18486 14846 16020 21338
## [12] 18628 11601 16227 31913 17749 23685 20531 16212 16107 19801 14050
## [23] 18054 22048 30858 17996 25291 17501 13028 14852 15395 22474 15121
## [34] 25786 22933 26651 15272 25799 20916 23718 25938 27759 19303 18875
## [45] 21493 20630 16860 20840 19299 17334
```

```r
mean(x) #this sample mean
```

```
## [1] 19917.08
```

Run the code below 3 more times and make note of the mean of each sample. Once more, calculate the average of your sample means and compare the result to the true mean of 19719.76. 


```r
x <- sample(collegecost$yearly, 50)
x
mean(x)
```

##Increase the number of samples!

**Now we're going to have R take 500 samples of n = 5 universities and record the mean of each sample.**

Specify the sample size, n. Then create a vector to store the sample means and draw the samples.

```r
n <- 5
xbar = rep(0,500) #This creates a vector of 500 0s.
for(i in 1:500) {xbar[i] = mean(sample(collegecost$yearly, n))}
```

Calculate the mean of the 500 sample means and compare it to the population mean, then create a histogram of the 500 sample means with a line at the population mean.

```r
mean(xbar) #the mean of the sample means
```

```
## [1] 19741.92
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
abline(v = datamean, col = "red", lwd = 2)
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
## [1] 19807.03
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
abline(v = datamean, col = "red", lwd = 2)
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
## [1] 19739.63
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
abline(v = datamean, col = "red", lwd = 2)
```

![](Module04-2_files/figure-html/unnamed-chunk-12-1.png)<!-- -->
