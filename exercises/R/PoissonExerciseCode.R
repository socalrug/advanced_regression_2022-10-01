insurance.data<- read.csv(file="./PoissonExerciseData.csv", header=TRUE, sep=",")

#fitting Poisson model
summary(fitted.model<- glm(accidents ~ gender + age + miles, data=insurance.data, 
family=poisson(link=log)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender="F", age=35, miles=100), type="response"))
