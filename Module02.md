# USU STAT 2300 Module 2
Camille Fairbourn  
#Module 2 Probability

As mentioned previously, each time you open a new RStudio session, you need to run the following three commands.


```r
require(mosaic)
require(openintro)
require(MASS)
```

In Module 2 we talk about nominal variables and create contingency tables to organize the counts of two different nominal variables.

First, we'll read in the flightNYC dataset. This is a subset of the data available in the nycflights13 package.

```r
flightNYC <- read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/flightNYC.csv")
```

Use the `View()` function to look at the variables in the dataset. This data measures 6 different variables on a sample of 600 flights from the JFK and LaGuardia (LGA) airports in New York City during 2013. Three of these variables are nominal and three are interval.

Variable  | Type     | Description
----------|----------|-------------
origin    | nominal  | Originating airport (JFK or LGA)
airline   | nominal  | Carrier (Delta or United Airlines)
ontime    | nominal  | Did the flight depart on time (yes or no)
distance  | interval | Distance of flight in miles
dep_delay | interval | Scheduled departure time - Actual departure time
arr_delay | interval | Scheduled arrival time - Actual arrival time


```r
View(flightNYC)
```

We can easily create a barchart for each of the nominal variables: origin, airline, and ontime.

Watch how the code and the chart change as we add arguments to the `barchart()` function.

####Basic barchart

```r
barchart(flightNYC$origin)
```

![](Module02_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

####Barchart with vertical bars

```r
barchart(flightNYC$origin, # Specify the variable to graph
         horizontal=FALSE) # Change to vertical bars
```

![](Module02_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

####Add a chart title

```r
barchart(flightNYC$origin, # Specify the variable to graph
         horizontal = FALSE, # Change to vertical bars
         main = "Originating Airport") # Add chart label
```

![](Module02_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

####Change the color of the bars

```r
barchart(flightNYC$origin, # Specify the variable to graph
         horizontal = FALSE, # Change to vertical bars
         main = "Originating Airport", # Add chart label
         col = "skyblue4") #change bar color
```

![](Module02_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

####Modify the y-axis label

```r
barchart(flightNYC$origin, # Specify the variable to graph
         horizontal = FALSE, # Change to vertical bars
         main = "Originating Airport", # Add chart label
         col = "skyblue4", #change bar color 
         ylab = "Count") #change vertical axis label
```

![](Module02_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

####Make a barchart for airline

```r
barchart(flightNYC$airline, horizontal=FALSE, 
         main="Airline", col="skyblue4", ylab="Count")
```

![](Module02_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

###Creating a contingency table
To create a contingency table, we use the `xtabs()` function. We need to specify which variables we want R to tabulate first, then indicate the data set. In the code below we create a contingency table for gender and broadband and store the result as contable.

```r
contable <- xtabs(~airline + ontime, data = flightNYC)
#Read the output from your table
contable
```

```
##         ontime
## airline   no yes
##   Delta  145 328
##   United  42  77
```
