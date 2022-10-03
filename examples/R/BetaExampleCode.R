libraries.data<- read.csv(file="./BetaExampleData.csv", header=TRUE, sep=",")

#install.packages("betareg")
library(betareg)

#fitting beta regression model
summary(fitted.model<- betareg(propontime ~ nbooks + ncardholders
+ location, data=libraries.data, link="logit")) 

#using fitted model for prediction
print(predict(fitted.model, 
data.frame(nbooks=15, ncardholders=2.5, location="rural")))
       


