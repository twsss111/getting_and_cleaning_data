#Getting and Cleaning Data - Project Assignment
##Introduction
This repository is my week 3 project homework for "Getting and Cleaning data" from John Hopkins University in Coursera.
The dataset being used is: Human Activity Recognition Using Smartphones
Course Project is:
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Files and Prerequisites
Prerequisites for the R code to work:
* The project assume all the data are present in the same folder (UCI HAR Dataset) and all the data should be un-compressed and without names changes.
* The UCI HAR Dataset must be available in a directory called "UCI HAR Dataset"
* The r code requires "reshape2" package. So the reshape2 package must be installed before running the run_analysis.R.
The files in this repo includes:
*  CodeBook.md  describes the variables, the data, and any transformations or work that was performed to clean up the data.
*  run_analysis.R  contains all the code to perform the analyses.
The output of the last step is called  final_average_data_for_wearable_computing.txt.

