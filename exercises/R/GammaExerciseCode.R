QIscore.data<- read.csv(file="C:/Users/local-admin.math-la5253lpB/Desktop/GammaExerciseData.csv",
header=TRUE, sep=',')

#plotting histogram with fitted normal density
#install.packages("rcompanion")
library(rcompanion)
plotNormalHistogram(QIscore.data$score)

#fitting gamma regression
summary(fitted.model<- glm(score~ desgn+wrkyrs+priorQI, 
data=QIscore.data, family=Gamma(link=log)))

#using fitted model for prediction
print(pred.score<- predict(fitted.model, type='response', 
data.frame(desgn='nurse', wrkyrs=7, priorQI='yes')))
