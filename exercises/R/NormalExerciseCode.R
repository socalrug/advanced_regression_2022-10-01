HR.data<- read.csv(file="C:/Users/local-admin.math-la5253lpB/Desktop/NormalExerciseData.csv", header=TRUE, sep=",")

#plotting histogram with fitted normal density
library(rcompanion)
plotNormalHistogram(HR.data$HR)


#fitting general linear model
summary(fitted.model<- glm(HR ~ age+gender+ethnicity+BMI+nmeds+AQI,
data=HR.data, family=gaussian(link=identity)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(age=50, gender="M", 
ethnicity="Hispanic", BMI=20, nmeds=0,AQI="moderate")))


