## You MUST install "reshape2" package to run this excise below
## load reshape2 library
  library(reshape2)
## Read raw data files

  # Read column names for test and training data since they share same colume names.
  feature <- read.table("./UCI HAR Dataset/features.txt")
  common_colname <- feature[,2]
  
  # Read the test data and use common_colname as the column names
  test_raw <- read.table("./UCI HAR Dataset/test/X_test.txt")
  colnames(test_raw) <- common_colname
  # Read the training data and use common_colname as the column names
  training_raw <- read.table("./UCI HAR Dataset/train/X_train.txt")
  colnames(training_raw) <- common_colname
  
  # Read activity ID and names. This is to prepare for later combining all the data into the first final data set.
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
  colnames(activity)=c("activityID","activityName")

  # Read subject ID for test data
  subjectID_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subjectID")
  # Read subject ID for training data
  subjectID_training <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subjectID")
  
  # Read the activity ID for test data
  activityID_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activityID")
  # Read the activity ID for training data
  activityID_training <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activityID")
  
##combine different data sets into one complete data set
  #combile subjectID, activityID and test raw data into a complete test data set 
  test_all<- cbind(subjectID_test , activityID_test , test_raw)
  #combile subjectID, activityID and training raw data into a complete training data set
  training_all<- cbind(subjectID_training , activityID_training , training_raw)
  #combile test_all and Training_all data into one compplete data set
  data_all<- rbind(test_all,training_all)

##Start to work on the first final data set
  #Select only the columes with "mean" or "std" to extract only the measurements on the mean and standard deviation
  col_number <- grep("mean|std",names(data_all),ignore.case=TRUE)
  col_name <- names(data_all)[col_number]
  selected_data <- data_all[,c("subjectID","activityID",col_name)]
  #Merge the activity name with selected_data. This is the first final data set.
  mergedData <- merge(activity,selected_data,by="activityID",all=TRUE)  

##Start to work on the second final dataset
  #Use melt function to prepare the data for second data set
  melt_data <- melt(mergedData,id=c("activityID","activityName","subjectID"))
  #use cast function get average of each variable for each activity and each subject. This is the second final data set.
  dataset_final <- dcast(melt_data, activityID + activityName + subjectID ~ variable,mean)

##write final dataset to a file
  write.table(dataset_final,"./UCI HAR Dataset/final_average_data_for_wearble_computing.txt")

