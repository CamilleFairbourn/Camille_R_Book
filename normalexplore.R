library(mosaic)

College2013 <- read.csv("C:/Users/Camille/Dropbox/Work/TheRFolder/Datasets/16-Spring/CollegeScorecard_Raw_Data/College2013.csv")

university <- filter(College2013, PREDDEG == 3 & HIGHDEG == 4 & CONTROL == 1)
str(university)

university1 <- select(university, INSTNM, CITY, STABBR, ADM_RATE, COSTT4_A, TUITIONFEE_IN, TUITIONFEE_OUT, AVGFACSAL, UGDS, PCTPELL, C150_4)
university2 <- filter(university1, C150_4 != "NA")
str(university2)
write.csv(university2, "complete.csv")

hist(university2$COSTT4_A)
hist(university1$C150_4)

s=sd(university1$C150_4)
m=mean(university1$C150_4)

#Add in the normal curve overlay
points(seq(min(university1$C150_4), max(university1$C150_4), length.out=500),
       dnorm(seq(min(university1$C150_4), max(university1$C150_4), length.out=500),
             m, s), type="l", col="darkblue", lwd=2)

#Divide the normal curve into regions
#Calculate and store the endpoints of the regions
endpoints<-c(-10*s+m,-1.5*s+m,-.75*s+m,m,m+.75*s,m+1.5*s,10*s+m)
#add the endpoint lines to the graph
abline(v=endpoints, col="red", lwd=3)

#Calculate the normal curve probabilities for each region
probs<-c(pnorm(-1.5),(pnorm(-.75)-pnorm(-1.5)), pnorm(0)-pnorm(-.75), 
         pnorm(.75)-pnorm(0), pnorm(1.5)-pnorm(.75), 1-pnorm(1.5))
probs

#Count the number of rows (data points) in the data set
n=nrow(university1)
n

#Calculate the expected values for each region
exvals<-probs*n
exvals

#Count the number of data points in each region and store it in a table
frequencies=table(cut(university1$C150_4,breaks = endpoints))
frequencies

#Use the command below to calculate the test statistic.
#You will have to recalculate the p-value using the correct df.
tst<-chisq.test(frequencies,p=probs)
tst$statistic
pval<-pchisq(tst$statistic,3,lower.tail=FALSE)
pval
