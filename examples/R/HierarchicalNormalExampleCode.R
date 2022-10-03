dyads.data<- read.csv(file="./HierarchicalNormalExampleData.csv", 
header=TRUE, sep=",")

#creating longform data set
#install.packages("reshape2")
library(reshape2)

data.depr<- melt(dyads.data[,c("family", "individual", "relation", "depression1","depression2",
"depression3")], id.vars=c("family","individual", "relation"), variable.name="depr.visits",
value.name="depression")
data.qol<- melt(dyads.data[,c("qol1","qol2", "qol3")], variable.name="qol.visits", value.name="qol")
longform.data<- cbind(data.depr, data.qol)

#creating numeric variable for time
visit<- ifelse(longform.data$depr.visits=="depression1", 1, ifelse(longform.data$depr.visits
=="depression2", 2, 3)) 

#plotting histogram with fitted normal density
#install.packages("rcompanion")
library(rcompanion)

plotNormalHistogram(longform.data$qol)

#fitting hierarchical model
#install.packages("lme4")
library(lme4)

summary(fitted.model<- lmer(qol ~ relation + depression + visit 
+ (1 + visit | family) + (1 + visit | family:individual), 
control=lmerControl(calc.derivs=FALSE), data=longform.data))

#using fitted model for prediction
print(predict(fitted.model, data.frame(family=25, individual=1, 
relation="M", depression=0, visit=3), allow.new.levels=TRUE))

