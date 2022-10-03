dosages.data<- read.csv(file="./LongitudinalLogisticExampleData.csv", 
header=TRUE, sep=",")

#creating longform dataset and time variable
#install.packages("reshape2")
library(reshape2)
longform<- melt(dosages.data, id.vars=c("patid", "dosage","gender"), variable.name="weekn", 
value.name="effects")
week<- ifelse(longform$weekn=="week1",1,ifelse(longform$weekn=="week3",3,
ifelse(longform$weekn=="week7",7,16)))

#fitting random slope and intercept logistic model
#install.packages("lme4")
library(lme4)
summary(fitted.model<- glmer(effects~dosage+gender+week+(1+week|patid), data=longform,
family=binomial(link="logit")))

#using fitted model for prediction
print(predict(fitted.model, data.frame(patid=29, dosage="A", gender="F",week=7),
re.form=NA, type="response"))




