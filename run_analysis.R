# To create R Script to merge, extract data mean, stdev, and create tidy data
setwd("D:\\Maneesha files\\Coursera\\wd")
testX = read.csv("UCI HAR Dataset/test/X_test.txt", header=F, sep="")
testY = read.csv("UCI HAR Dataset/test/Y_test.txt", header=F, sep="")
testX[,562] = testY
testSubj = read.csv("UCI HAR Dataset/test/subject_test.txt", header=F, sep="")
testX[,563] = testSubj

trainX = read.csv("UCI HAR Dataset/train/X_train.txt", header=F, sep="")
trainY = read.csv("UCI HAR Dataset/train/Y_train.txt", header=F, sep="")
trainX[,562] = trainY
trainSubj = read.csv("UCI HAR Dataset/train/subject_train.txt", header=F, sep="")
trainX[,563] = trainSubj

# Merge training and test sets 
testandtrain = rbind(testX,trainX)

# To Read and make the feature-names better suit for R 
features = read.csv("UCI HAR Dataset/features.txt", header=F, sep="")

# Get the data on mean and stdev.
meanstd <- grep(".*mean.*|.*std.*", features[,2])

# Reduce the features table as per need
features <- features[meanstd,]
features[,2] <- gsub('-mean','Mean',features[,2])
features[,2] <- gsub('-std','Std',features[,2])
features[,2] <- gsub('[-()]','',features[,2])

# Add last two columns - subject & activity
meanstd = c(meanstd,562,563)

# Remove unwanted columns
testandtrain <- testandtrain[,meanstd]

# Add the column names Activity & Subject
colnames(testandtrain) <- c(features[,2], "Activity", "Subject")

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

activityClass = 1
for (activityClassLabel in activityLabels$V2) {
        testandtrain$Activity <- gsub(activityClass, activityClassLabel, testandtrain$Activity)
        activityClass <- activityClass + 1
}

testandtrain$Activity <- as.factor(testandtrain$Activity)
testandtrain$Subject <- as.factor(testandtrain$Subject)
activityAvg <- aggregate(testandtrain, by=list(ActivityAVG=testandtrain$Activity,SubjectAVG=testandtrain$Subject), FUN="mean")

# Remove the columns Activity & Subject to make tidier
tidydataset <- activityAvg[, -which(names(activityAvg) %in% c("Activity","Subject"))]
write.table(tidydataset, "tidydata.txt", sep="\t")
