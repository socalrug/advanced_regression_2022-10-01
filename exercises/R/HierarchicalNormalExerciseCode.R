school<- read.csv(file='C:/Users/local-admin.math-la5253lpB/Desktop/HierarchicalNormalExerciseData.csv',
                  header=TRUE, sep=',')

#plotting histogram with fitted normal density
#install.packages("rcompanion")
library(rcompanion)

plotNormalHistogram(school$score)

#fitting hierarchical model
#install.packages("lme4")
library(lme4)
summary(fitted.model<- lmer(score~API+classsize+year+(1+year|school)
+(1+year|school:subject),data=school))

#prediction, using hierarchical model with slope and intercept
print(predict(fitted.model, data.frame(school=2, API=753, subject='Math', 
classsize=36, year=17),allow.new.levels=TRUE))
