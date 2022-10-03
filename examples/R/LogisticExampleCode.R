companies.data<- read.csv(file="./LogisticExampleData.csv", 
header=TRUE, sep=",")

#specifying reference category
approach.rel<- relevel(as.factor(companies.data$approach), ref="comp")

#fitting logistic model
summary(fitted.model<- glm(approach.rel ~ ownership + nemployees, 
data=companies.data, family=binomial(link=logit)))

#using fitted model for prediction
print(predict(fitted.model, type="response", 
data.frame(ownership="sole", nemployees=40)))
