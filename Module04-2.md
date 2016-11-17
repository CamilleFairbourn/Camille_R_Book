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

Let's take a simple random sample of 5 of these universities and store the results in a vector called x. We will also calculate the mean for the sample. Notice that if you run the same code on your computer, you will not get the same answer as is shown here. This is because R draws a new sample of 5 colleges each time you run the command.


```r
x <- sample(collegecost$yearly, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
```

```
## [1] 19894 15906 21338 18158 20404
```

```r
mean(x) #this sample mean
```

```
## [1] 19140
```

Run the code below 3 more times and make note of the mean of each sample. Then calculate the average of your sample means and compare the result to the true mean of 1.971976\times 10^{4}. 


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
##  [1] 24375 16707  7715 16107 20601 18406 16953 18387 17093 22485 16605
## [12] 22497 15207 22800 16377 13026 21601 15753 15395 13065
```

```r
mean(x) #this sample mean
```

```
## [1] 17557.75
```

Run the code below 3 more times and make note of the mean of each sample. Then calculate the average of your sample means and compare the result to the true mean of 1.971976\times 10^{4}. 


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
##  [1] 16684 22926 14050 21160 16538 17487 14549 13735 18959 21732 21432
## [12] 19843 28980 18879 21249 18092 13756 20846 18472 29751 18077 19178
## [23] 19117 21971 13026 20799 21862 19299 18042 20611 17440 16953 14925
## [34] 15218 22771 16345 22461 20796 19173 20899 25799 15906 21966 22936
## [45] 15874 23346 21398 24234 16877 20422
```

```r
mean(x) #this sample mean
```

```
## [1] 19536.82
```

Run the code below 3 more times and make note of the mean of each sample. Once more, calculate the average of your sample means and compare the result to the true 4 mean of 1.971976\times 10^{4}. 


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
## [1] 19716.01
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
## [1] 19668.55
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
## [1] 19720.67
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
