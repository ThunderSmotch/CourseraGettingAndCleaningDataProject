README - Getting and Cleaning Data - Coursera Final Project
======

A brief description on how the code works.

## File: run_analysis.R

To be able to run this file properly you need to ensure that you have the dataset available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory. 

There is some commented code at the beginning of the file that automatically downloads and extracts the dataset if you so desire.

This code file is divided into 5 separate steps that will be explained below.

### Step 1 - Merge the training and test sets to create one data set

In this step we import all three datasets from the train and test folder making use of the read.table function.

Afterwards we create a dataframe for each folder (one for train and one for test) and we give appropriate names to the first two variables, the subject ID and the activity pertaining this observation.

Lastly, we merge the rows of both dataframes into a global one called "dataset" and we remove the unused data frames from memory as they are no longer necessary.

At this step our "dataset" contains 10299 observations with the first column being the subject ID, the second one being the activity ID and the other 561 variables being the measurements made for this observation.

### Step 2 - Extract only mean and std deviation measurements

On the dataset a file called "features.txt" contains the name of all the variables for the last 561 columns.

Analyzing this file we see that the variables that interests us are the ones containing the string "mean()" or "std()" on their name as those are the mean and standard deviation.

To be able to only extract those we load the file into a table and using regex and the grep function we match the row indexes for the measurements that either contain the literal "mean()" or "std()". We shift those indexes by 2 due to our initial two columns and lastly we create a new dataframe by subsetting the old one to only contain the first two columns and the ones where the regex matched.

At the end of this step we have a dataframe named "dataset_modified" that contains 10299 observations of 68 variables, 2 of them being the subject and activity ID and the other 66 being mean and std measurements.

### Step 3 - Uses descriptive activity names to name the activities in the data set

In this step we want to change the values for the activity columns of our dataset to use descriptive names instead of the current 1 to 6 nomenclature.

In the file "activity_labels.txt" in the dataset we can see the name for each activity and its associated index. Thus we load this file, we convert each integer in the activity column to a character/string and using the "stringr::str_replace_all" function we replace every integer by its associated name.

At the end of this step we have the same "dataset_modified" but the activity column now uses descriptive names instead of integers from 1 to 6.

### Step 4 - Appropriately labels the data set with descriptive variable names

In this step we want to name the 66 unnamed columns in our "dataset_modified" dataframe. To do this we note that the file "features.txt" in the dataset already has a descriptive name for each variable.

As such as we already have this file loaded from Step 2 we make use of the already created list of indexes that match a mean or std measurement to create a list of variable names.

We modify this list of variables names to remove characters like "()" and "-" in order to make them more readable.

We combine the names for the first two columns with this list of variable names to name every single column of our "dataset_modified" dataframe.

### Step 5 - Create a data set with average of each variable

In this final step we want to create a new dataset where we take the average for each subject and activity pair.

We make use of the "dplyr" package to do this quickly. Firstly we order the data so that the rows are ordered by subject and then by activity name. Then we create a tibble from the dataframe, we group the data by subject and activity and then we summarize across all other columns performing the mean function which will give the average of the data for each unique pair of subject and activity values.

We save this dataset into the "tidy_set" variable and we export this to a txt file named "tidy_set.txt" that is available in our workspace directory.