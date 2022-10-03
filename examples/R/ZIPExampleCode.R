smoking.data<- read.csv(file="./ZIPExampleData.csv", header=TRUE, sep=",")
#install.packages("pscl")
library(pscl)

#fitting zero-inflated Poisson model
summary(fitted.model<- zeroinfl(cigarettes ~ gender + age | health, data=smoking.data))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender="M", health="good", age=50)))
