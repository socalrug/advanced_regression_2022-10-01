birds.data<- read.csv(file="./BetaExerciseData.csv", header=TRUE, sep=",")

#install.packages("betareg")
library(betareg)

#fitting beta regression
summary(fitted.model<- betareg(propmigrated~mass+wingspan+distance, 
data=birds.data, link="logit"))

#using fitted model for prediction
print(70*predict(fitted.model, data.frame(mass=.6, wingspan=65, distance=1.65)))
