health.data<- read.csv(file='C:/Users/local-admin.math-la5253lpB/Desktop/ZIPExerciseData.csv',
header = TRUE, sep=',')

library(pscl)

#fitting zero-inflated Poisson model
summary(fitted.model<- zeroinfl(attacks~BMI+age+gender|smoking, 
data=health.data))

#using fitted model for prediction
print(predict(fitted.model, data.frame(BMI=21.2, age=60, 
gender='M', smoking='yes')))
