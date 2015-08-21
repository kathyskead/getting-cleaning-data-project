##Getting and Cleaning Data Course Project
This script prepares a tidy data set from data collected from accelerometers from the Samsung Galaxy S smartphone. Find a full description of the data here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Step 1:
The script cleans up your work space.
Loads the "dplyr" library and sets the working directory.

#Step 2:
The following datasets are read into R with the read.table() function:

test/subject_test.txt
train/subject_train.txt

test/X_test.txt
train/X_train.txt

test/y_test.txt
train/y_train.txt

features.txt
activity_labels.txt

#Step 3:
The row_bind() function is used to combine datasets:
The subject datasets are combined into one dataset named "subjectData"
The x test and train datasets are combined into one dataset named "xData".
The y test and train datasets are combined into one dataset named "yData".

#Step 4:
The names() function is used to give variables in the datasets names:
The variable in "subjectData" is named "subject".
The variable in "yData" is named "activity"
The variables in "xData" are assigned names from the features.txt dataset.

#Step 5:
The subjectData, xData and yData are then combined into a single dataset "data" by useing the bind.cols() function.

#Step 6:
All duplicate variables are dropped from the combined dataset using the !duplicated() function.

#Step 7:
Only the measurements on the mean and standard deviation for each measurement are extract from the dataset by selecting the following variables: activity, subject and any variables containing the names "mean" and "std".

#Step 8:
Descriptive activity names from activity_labels.txt are used to assign names to the activity variable by using the factor() function.

#Step 9:
The data is appropriately labeled using descriptive variable names with the gsub() function.

#Step 10:
A second, independent tidy data set with the average of each variable for 
each activity and each subject is created using the aggregate() function.

#Step 11:
Finally a tidydata.txt file is written using the write.table() function.
