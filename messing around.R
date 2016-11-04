MaleRacers <- filter(TenMileRace, sex == "M")
str(MaleRacers)
AdultMaleRacers <- filter(MaleRacers, age >=18)
str(AdultMaleRacers)
hist(AdultMaleRacers$time)
ggplot(AdultMaleRacers, aes(x = age, y = time)) +
   geom_point()
fortys <- filter(MaleRacers, age >=40 & age <50)
hist(thirtys$time)

men <- filter(NHANES, Gender == "male")
str(men)
hist(men$Age)
men <- filter(men, Age >=20, Height != "NA")
str(men)
hist(men$Height)
male_heights <- sample_n(men, 250)
male_heights <- select(male_heights, Height)
names(male_heights) <- c("height")
hist(male_heights$height, breaks = seq(140,210,2.5), prob = TRUE)
points(seq(140, 210, length.out=500),
       dnorm(seq(140, 210, length.out=500),
             mean(male_heights$height), sd(male_heights$height)), type="l", col="darkblue", lwd=2)

write.csv(male_heights, "males3.csv")
m <- mean(male_heights$height)
s <- sd(male_heights$height)

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
n=nrow(male_heights)
n

#Calculate the expected values for each region
exvals<-probs*n
exvals

#Count the number of data points in each region and store it in a table
frequencies=table(cut(male_heights$height,breaks = endpoints))
frequencies

#Use the command below to calculate the test statistic.
#You will have to recalculate the p-value using the correct df.
tst<-chisq.test(frequencies,p=probs)
tst$statistic
pval<-pchisq(tst$statistic,3,lower.tail=FALSE)
pval


str(COL)
hist(COL$Comp)
hist(COL$Grocery)
hist(COL$Utilities)
Util<-filter(COL, Utilities != "NA")
View(COL)
hist(Util$Utilities)
UT<-COL$Utilities
str(UT)
Util <- filter(COL, Utilities <= 150)
COL <- as.data.frame(COL)
str(COL)
vars <- c("INSTNM", "CITY", "STABBR", "PREDDEG", "HIGHDEG", "CONTROL", "region", "UGDS", "UG", "COSTT4_A", "TUITIONFEE_IN", "TUITIONFEE_OUT")
coll13<-select(College2013, one_of(vars))

West <- c("CA","WA","OR","ID","MT","UT","NV","AZ","NM","CO","OK","TX","NE","KS","ND","SD","MN","IA","MO","AR","LA","AK","HI","WY","GU")
East <- c("WI", "IL", "MI","OH","KY","IN","TN","MS","AL","GA","FL","SC","NC","WV","VA","MD","DE","PA","NJ","CT","NY","VT","MA","NH","ME","VI","DC")

WestR <- c(4,6,7,8,9)
EastR <- c(0,1,2,3,5)
coll13$place <- "NA"
coll13$region <- str_replace(coll13$region, "5", "EAST")
coll13$region <- str_replace(coll13$region, "9", "WEST")
View(coll13)
coll13A <- filter(coll13, HIGHDEG==4 & (PREDDEG==3 | PREDDEG == 4) & CONTROL == 1)
coll13B <- filter(coll13A, UGDS != "NA" & COSTT4_A != "NA" & TUITIONFEE_IN != "NA" & TUITIONFEE_OUT !="NA")
collegecost$region <- "NA"
View(collegecost)
if(collegecost$state )
write.csv(collegecost, "collegecost.csv")
 
                    
select(iris, starts_with("Petal"))
