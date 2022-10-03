psoriasis.data<- read.csv(file="./LongitudinalPoissonExerciseData.csv", 
header=TRUE, sep=",")

#creating longform data set
#install.packages("reshape2")
library(reshape2)

longform.data<- melt(psoriasis.data, id.vars=c("patid", "group"), 
variable.name = "visits", value.name="npatches")

#creating numeric variable for time
weeks<- ifelse(longform.data$visits=="day1", 0.14, ifelse(longform.data$visits
=="week1", 1, ifelse(longform.data$visits=="week2", 2,ifelse(longform.data$visits=="week5", 
5, 13))))

#fitting random slope and intercept Poisson model
#install.packages("lme4")
library(lme4)

summary(fitted.model<- glmer(npatches ~ group + weeks 
+ (1 + weeks|patid), data=longform.data, family=poisson(link="log")))

#using fitted model for prediction
print(predict(fitted.model, data.frame(patid=11, group="Tx", 
weeks=5), re.form=NA, type="response"))


