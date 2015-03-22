This code book describes the variables, the data, and any transformations or work that I performed to clean up the data. 

##Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##The data source
*Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
*Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


##Variables
*features  contains the column names for test_raw and training_raw datasets.
*test_raw ,  training_raw ,  activity ,  subjectID_test  ,  subjectID_training , activityID_test , activityID_training  contain the data from the downloaded files.
*test_all ,  training_all  and  data_all  combined the previous datasets for next step analysis.
*mergedData  contains all the columns contains "mean" or "std"

##transformation steps
The script  run_analysis.R performs the following steps described in the course project's definition.
*First, all the test and training data are merged using the  cbind() function. Since test_raw and training_raw having the same number of columns and column names, I used rbind() function to combine them into a complete data set called data_all.
*Then, only those columns with the mean and standard deviation measures are taken from the data_all dataset. The new data set is called selected_data merge with the feature table from features.txt. It formed the first final data set which is called mergedData.
*Finally, I generate the second final dataset with all the average measures for each subject and activity type. The output file is called  final_average_data_for_wearable_computing.txt , and uploaded to this repository.

##Data
The dataset includes the following files:
*'README.txt'
*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'train/X_train.txt': Training set.
*'train/y_train.txt': Training labels.
*'test/X_test.txt': Test set.
*'test/y_test.txt': Test labels.

