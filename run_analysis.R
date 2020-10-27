## Step 0 - Download data set
## Uncomment the code to download and setup the files

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, "data.zip", method="curl")
#unzip("data.zip") 

# Data set MUST be on the "UCI HAR Dataset" folder on your working directory!

## Step 1 - Merge the training and test sets to create one data set

## Import Test Data
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Import Training Data
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Create test data set
test_set <- data.frame(sub_test, y_test)
colnames(test_set) <- c("subject", "activity")
test_set <- data.frame(test_set, X_test)

## Create 
train_set <- data.frame(sub_train, y_train)
colnames(train_set) <- c("subject", "activity")
train_set <- data.frame(train_set, X_train)

## Merging data sets
dataset <- rbind(test_set, train_set)

## Remove unused data frames
rm(sub_test, sub_train, y_test, y_train, X_test, X_train, test_set, train_set)

## Step 2 - Extract only mean and std deviation measurements

## Info about the measurements is in the features.txt file
features <- read.table("./UCI HAR Dataset/features.txt")
measurements <- grep("mean\\(\\)|std\\(\\)", features$V2)
indexes <- c(1,2 , (measurements + 2) ) # Shift by two and add first two columns

dataset_modified <- dataset[, indexes]

## Step 3 - Uses descriptive activity names to name the activities in the data set

## Info about the activities are in the activity_labels.txt file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

activities <- as.character(dataset_modified$activity)
for(i in 1:6){
  activities <- stringr::str_replace_all(activities, as.character(activity_labels[i, 1]), activity_labels[i, 2]) 
}
dataset_modified$activity <- activities

## Step 4 - Appropriately labels the data set with descriptive variable names

## First two columns were already well named beforehand, we just need to name
## the measurement ones, making use of the features.txt file

## Here we change slightly the names to make them more readable
varnames <- stringr::str_replace_all(features$V2[measurements] ,"mean\\(\\)", "Mean")
varnames <- stringr::str_replace_all(varnames, "std\\(\\)", "Std")
varnames <- stringr::str_replace_all(varnames, "\\-", "")

colnames(dataset_modified) <- c("subject", "activity", varnames)

## Step 5 - Create a data set with average of each variable

## First we order the data set by subject and activity
dataset_modified <- dataset_modified[order(dataset_modified$subject, dataset_modified$activity),]

## Use dplyr library to summarize data grouped by subject and activity
library(dplyr)
tidy_set <- as_tibble(dataset_modified) %>%
        group_by(subject, activity) %>%
        summarise(across(everything(), mean))

## Export the tidy data set to txt file
write.table(tidy_set, "./tidy_set.txt",row.names = FALSE)

