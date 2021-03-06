# Clean up work space
rm(list=ls())

# Load necessary libraries and set working directory
library(dplyr)
setwd("C:\\Users\\mskead\\Google Drive\\Data Science Course\\Getting and cleaning data\\Data\\UCI HAR Dataset")

# Read tables into R
subjectTest <- read.table("test/subject_test.txt")
subjectTrain <- read.table("train/subject_train.txt")
xTest <- read.table("test/X_test.txt")
xTrain <- read.table("train/X_train.txt")
yTest <- read.table("test/y_test.txt")
yTrain <- read.table("train/y_train.txt")
featureNames <- read.table("features.txt")
activity_lables <- read.table("activity_labels.txt")

# Combine tables
subjectData <- bind_rows(subjectTest, subjectTrain)
xData <- bind_rows(xTest, xTrain)
yData <- bind_rows(yTest, yTrain)

# Name variables
names(subjectData) <- c("subject")
names(yData) <- c("activity")
names(xData) <- featureNames$V2

# Combine columns to get one data set
data <- bind_cols(subjectData, yData, xData)

# Drop duplicate columns
data <- data[ !duplicated(names(data)) ]

# Select only the following variables: activity, subject and those containing "mean" and "std"
data <- select(data, activity, subject, contains("mean"), contains("std"))

# Add descriptive activity names from activity_labels.txt to name activities
data$activity <- factor(data$activity, levels = activity_lables[,1], labels = activity_lables[,2])

# Across all columns replace an abbreviation with full descriptive word
names(data) <- gsub("^t","Time", names(data))
names(data) <- gsub("Acc","Accelerometer", names(data))
names(data) <- gsub("Gyro","Gyroscope", names(data))
names(data) <- gsub("Mag","Magnitude", names(data))
names(data) <- gsub("^f","Frequency", names(data))
names(data) <- gsub("BodyBody","Body", names(data))

# Create a second, independent tidy data set with the average of each variable for 
#each activity and each subject.
tidydata <- aggregate(.~activity + subject, data, mean)

# Create a tidydata.txt file
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)
