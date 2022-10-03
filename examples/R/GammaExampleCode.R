real.estate.data<- read.csv(file="./GammaExampleData.csv", 
header=TRUE, sep=",")

#rescaling variables
price10K<- real.estate.data$price/10000
sqftK<-real.estate.data$sqft/1000
lotsizeK<-real.estate.data$lotsize/1000

#plotting histogram with fitted normal density
#install.packages("rcompanion")
library(rcompanion)
plotNormalHistogram(price10K)

#fitting gamma regression 
summary(fitted.model<- glm(price10K ~ nbedrooms + nbathrooms 
+ sqftK + heating + AC + lotsizeK, data=real.estate.data,
family=Gamma(link=log)))

#using fitted model for prediction
print(10000*predict(fitted.model, type="response", data.frame(nbedrooms=4,
nbathrooms=2, sqftK=1.68, heating="central", AC="no", lotsizeK=5)))

