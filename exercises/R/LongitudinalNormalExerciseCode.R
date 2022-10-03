fit.data<- read.csv(file="./LongitudinalNormalExerciseData.csv", header=TRUE, sep=",")

#install.packages("reshape2")
library(reshape2)

#creating longform dataset
data1<- melt(fit.data[,c("id","gender","age","oxygen1","oxygen2","oxygen3")],
         id.vars=c("id","gender","age"),variable.name="oxygenlevel",value.name="oxygen")
data2<- melt(fit.data[,c("runtime1","runtime2","runtime3")],variable.name="runtimelevel",
             value.name="runtime")
data3<- melt(fit.data[,c("pulse1","pulse2","pulse3")],variable.name="pulselevel",value.name="pulse")
data4<- cbind(data1,data2)

longform.data<- cbind(data4,data3)

condition<- ifelse(longform.data$oxygenlevel=="oxygen1",1,
  ifelse(longform.data$oxygenlevel=="oxygen2",2,3))

#plotting histogram
#install.packages("rcompanion")
library(rcompanion)

plotNormalHistogram(longform.data$pulse)

#fitting random slope and intercept model
#install.packages("nlme")
library(nlme)

summary(fitted.model<- lme(pulse ~ gender + age + oxygen + runtime + condition,
random =~ 1 + condition | id, control=lmeControl(opt="optim"), data=longform.data))

#using the fitted model for prediction
print(predict(fitted.model, data.frame(gender=0, age=36, condition=1, oxygen=40.2, 
runtime=10.3),level=0))




