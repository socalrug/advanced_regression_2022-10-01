cholesterol.data<- read.csv(file="./LongitudinalNormalExampleData.csv", 
header=TRUE, sep=",")

#creating long-form data set
library(reshape2)

longform.data<- melt(cholesterol.data, id.vars=c("id", "gender", "age"), 
variable.name = "LDLmonth", value.name="LDL")

#creating numeric variable for time
month<- ifelse(longform.data$LDLmonth=="LDL0", 0, ifelse(longform.data$LDLmonth
=="LDL6", 6, ifelse(longform.data$LDLmonth=="LDL9",9,24)))

#plotting histogram with fitted normal density
library(rcompanion)

plotNormalHistogram(longform.data$LDL)

#fitting random slope and intercept model
library(nlme)

summary(fitted.model<- lme(LDL ~ gender+age+month, 
random =~ 1+month|id, data=longform.data))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender="F", 
age=48, month=3), level=0))


