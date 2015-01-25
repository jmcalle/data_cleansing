#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

mergeSets<-function(inputPath){
  setwd(inputPath)
  features <-read.table("features.txt", col.names = c("ID" , "Description"))
  
  
  #Retrieve test datasets
  X_test = read.table("test/X_test.txt", col.names = features$Description)
  Y_test = read.table("test/Y_test.txt", col.names = c("ActivityID"))

  subject_test = read.table("test/subject_test.txt", col.names = c("SubjectID"))
  
  #Retrieve activity info
  activity <- read.table("activity_labels.txt", header=F, col.names=c("ActivityID", "ActivityName"))

  #Retrieve train dataset
  X_train = read.table("train/X_train.txt", col.names = features$Description)
  Y_train = read.table("train/Y_train.txt", col.names = c("ActivityID"))

  subject_train = read.table("train/subject_train.txt", col.names = c("SubjectID"))

  filteredCols <- grep(".*mean\\(\\)|.*std\\(\\)", features$Description)
  
  X_train <- X_train[,filteredCols]
  X_test <- X_test[,filteredCols]
  
  train <- cbind(X_train, Y_train,subject_train)
  test <- cbind(X_test, Y_test,subject_test)
  
  appended_table <- rbind(train, test)

  merged_table <- merge(appended_table, activity)

}

#Here we receive the data frame that is already merged and labelled and create a dataset containing the average of each variable for each activity and each subject.
tidyData <- function(merged_data) {
  library(reshape2)
  
  # filter necessary columns
  id_vars = c("ActivityID", "ActivityName", "SubjectID")
  feature_vars = setdiff(colnames(merged_data), id_vars)
  melted_data <- melt(merged_data, id=id_vars, measure.vars=feature_vars)
  # Group by IDs and perform mean function throughout the measures
  tidy_data <- dcast(melted_data, SubjectID + ActivityID + ActivityName ~ variable, fun.aggregate = mean, na.rm = TRUE)    
}

# Process the data as required, create the tidy data set and write it into a file
processData <- function(inputpath, output_filename) {
#Assumes the path give is accessible in our disk so control mechanisms are implemented. Likewise output_filename.
  tidy_data <- tidyData(mergeSets(inputpath))
  write.table(tidy_data, output_filename, row.name = FALSE)
}
