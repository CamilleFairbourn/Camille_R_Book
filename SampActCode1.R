#Require packages
require(mosaic)
require(MASS)
require(openintro)

#Read in the collegecost data set
collegecost<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/collegecost.csv")

#Construct a frequency histogram of the truck weights
hist(collegecost$yearly,
     main = "Public Universities in the United States, 2013",
     xlab = "Average yearly cost of attendance in $",
     prob = TRUE)

#Calculate the mean of the yearly costs
mean(collegecost$yearly)

#Add a vertical line at the mean of the data set
abline(v = mean(collegecost$yearly), col = "red", lwd = 3)


#Now take a simple random sample of 5 of these universities and
#store the results in a vector called x.
x<-sample(collegecost$yearly, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 24 through 27 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.


#Now take a simple random sample of 20 of these universities and
#store the results in a vector called x.
x<-sample(collegecost$yearly, 20)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 36 through 39 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.

#Now take a simple random sample of 50 of these universities and
#store the results in a vector called x.
x<-sample(collegecost$yearly, 50)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 47 through 450 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.