library(class)
library(MASS)
library(plyr)
library(rpart)
library(randomForest)
library(zoo)

allTrain = read.table(file = 'C:/Users/sneha/Documents/SAP/input1.tsv/input1.tsv', sep = '\t', header = TRUE)
allTrain2 = read.table(file = 'C:/Users/sneha/Documents/SAP/input2.tsv/input2.tsv', sep = '\t', header = TRUE)
locations = read.table(file = 'C:/Users/sneha/Documents/SAP/locations.tsv', sep = '\t', header = TRUE)

head(allTrain,1)
head(locations,1)
head(merged,5)

names(allTrain)[1]<-"position"
names(allTrain)[2]<-"nucl"
names(allTrain)[3]<-"quality"
names(allTrain)[4]<-"abundance"
names(allTrain)[5]<-"mapping"

names(locations)[1]<-"position2"
names(locations)[2]<-"nucl2"
names(locations)[3]<-"frequency"


merged = merge(x = allTrain, y = locations, by.x = "position", by.y="position2", all = TRUE)
na.aggregate(merged)

classifyReads <- function(y,yhat) {

}


tree <- rpart(frequency ~ quality, abundance, mapping,data=merged, control=rpart.control(minbucket=100, maxdepth = 10, xval = 7),method="class")
rf = randomForest(frequency ~ ., data=merged, ntree=100, mtry=5, nodesize = 100)
