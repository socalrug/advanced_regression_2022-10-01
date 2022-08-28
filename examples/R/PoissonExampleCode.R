hospitalstay.data<- read.csv(file="C:/Users/local-admin.math-la5253lpB/Desktop/PoissonExampleData.csv", header=TRUE, sep=",")

#fitting Poisson model
summary(fitted.model<- glm(days ~ gender + age + illness, 
data=hospitalstay.data, family=poisson(link=log)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender="M", age=55, illness="no"), 
type="response"))