##SECTION 1: Merging the data

    # We assume the zip file with the raw data has been unzipped in the current directory.
    
    # The method is to merge each of subject_train & subject_test, y_train & y_test, and X_train & X_test,
    # then use data.frame to put all the combined vectors together.
    
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
    subject <- rbind(subject_train, subject_test)
    
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
    y <- rbind(y_train, y_test)
    
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
    X <- rbind(X_train, X_test)

    phone_data_raw <- data.frame(subject, y, X)
        
##SECTION 2: Removing data other than means and standard deviations
    
    # Columns kept are those which are either a mean or standard deviation measurement.
    # Please see codebook.md for brief descriptions of the measurements retained.
    columns_kept <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 229:230, 242:243, 255:256, 268:273, 347:352, 375:377, 426:431, 454:456, 505:506, 515, 518:519, 531:532, 544:545, 554, 558:563)
    phone_data <- phone_data_raw[,columns_kept]
    
##SECTION 3: Adding useful activity names

    # Recall from step 1 that the activity numbers (y) were in column 2.
    # We use six sub statements to replace the activity numbers with their descriptions.

    phone_data[,2] <- sub(1, "WALKING", phone_data[,2])
    phone_data[,2] <- sub(2, "WALKING_UPSTAIRS", phone_data[,2])
    phone_data[,2] <- sub(3, "WALKING_DOWNSTAIRS", phone_data[,2])
    phone_data[,2] <- sub(4, "SITTING", phone_data[,2])
    phone_data[,2] <- sub(5, "STANDING", phone_data[,2])
    phone_data[,2] <- sub(6, "LAYING", phone_data[,2])
    
##SECTION 4: Adding useful descriptions to the columns
    
    # Please see Codebook.md for an explanation of what the column names mean.
    # Columns 1 and 2 are the test subject and the activity, respectively.
    # The remaining columns use the names from features.txt with dashes ("-")
    # replaced by underscores("_"), and double parenthesis removed. 
    
    phone_column_names <- c("Subject", "Activity", 
                            "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", 
                            "tBodyAcc_std_Y", "tBodyAcc_std_Z", "tGravityAcc_mean_X", "tGravityAcc_mean_Y", 
                            "tGravityAcc_mean_Z", "tGravityAcc_std_X", "tGravityAcc_std_Y", 
                            "tGravityAcc_std_Z", "tBodyAccJerk_mean_X", "tBodyAccJerk_mean_Y", 
                            "tBodyAccJerk_mean_Z", "tBodyAccJerk_std_X", "tBodyAccJerk_std_Y", 
                            "tBodyAccJerk_std_Z", "tBodyGyro_mean_X", "tBodyGyro_mean_Y", 
                            "tBodyGyro_mean_Z", "tBodyGyro_std_X", "tBodyGyro_std_Y", "tBodyGyro_std_Z", 
                            "tBodyGyroJerk_mean_X", "tBodyGyroJerk_mean_Y", "tBodyGyroJerk_mean_Z", 
                            "tBodyGyroJerk_std_X", "tBodyGyroJerk_std_Y", "tBodyGyroJerk_std_Z", 
                            "tBodyAccMag_mean", "tBodyAccMag_std", "tBodyAccJerkMag_mean", 
                            "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", 
                            "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_mean_X", 
                            "fBodyAcc_mean_Y", "fBodyAcc_mean_Z", "fBodyAcc_std_X", "fBodyAcc_std_Y", 
                            "fBodyAcc_std_Z", "fBodyAccJerk_mean_X", "fBodyAccJerk_mean_Y", 
                            "fBodyAccJerk_mean_Z", "fBodyAccJerk_std_X", "fBodyAccJerk_std_Y", 
                            "fBodyAccJerk_std_Z", "fBodyAccJerk_meanFreq_X", "fBodyAccJerk_meanFreq_Y", 
                            "fBodyAccJerk_meanFreq_Z", "fBodyGyro_mean_X", "fBodyGyro_mean_Y", 
                            "fBodyGyro_mean_Z", "fBodyGyro_std_X", "fBodyGyro_std_Y", "fBodyGyro_std_Z", 
                            "fBodyGyro_meanFreq_X", "fBodyGyro_meanFreq_Y", "fBodyGyro_meanFreq_Z", 
                            "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyAccMag_meanFreq", 
                            "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", 
                            "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std", 
                            "fBodyBodyGyroJerkMag_meanFreq", "angle(tBodyAccJerkMean),gravityMean)", 
                            "angle(tBodyGyroMean,gravityMean)", "angle(tBodyGyroJerkMean,gravityMean)", 
                            "angle(X,gravityMean)", "angle(Y,gravityMean)", "angle(Z,gravityMean)")
    colnames(phone_data) <- phone_column_names
    
##SECTION 5: Creating the tidy data set to upload to Coursera

    # The goal here is to present the data in what database users call
    # First Normal Form (1NF), where there is exactly one data point per row.
    # This format will have three columns: Activity, Observation Type, and Mean.
    
    # First, we calculate the means for each activity.
    
    activ_1 <- subset(phone_data, Activity=="WALKING")
    tidy_1 <- apply(activ_1[,3:80], 2, mean)

    activ_2 <- subset(phone_data, Activity=="WALKING_UPSTAIRS")
    tidy_2 <- apply(activ_2[,3:80], 2, mean)
    
    activ_3 <- subset(phone_data, Activity=="WALKING_DOWNSTAIRS")
    tidy_3 <- apply(activ_3[,3:80], 2, mean)

    activ_4 <- subset(phone_data, Activity=="SITTING")
    tidy_4 <- apply(activ_4[,3:80], 2, mean)

    activ_5 <- subset(phone_data, Activity=="STANDING")
    tidy_5 <- apply(activ_5[,3:80], 2, mean)
    
    activ_6 <- subset(phone_data, Activity=="LAYING")
    tidy_6 <- apply(activ_6[,3:80], 2, mean)
    
    # Next, for each of the six activites, we generate data frames
    # that have the name of the activity in the first column,
    # the observation type in the second column, 
    # and the means in the third column.
    
    tidy_1b <- data.frame("WALKING", phone_column_names[3:80], unname(tidy_1), stringsAsFactors = FALSE)
    tidy_2b <- data.frame("WALKING_UPSTAIRS", phone_column_names[3:80], unname(tidy_2), stringsAsFactors = FALSE)
    tidy_3b <- data.frame("WALKING_DOWNSTAIRS", phone_column_names[3:80], unname(tidy_3), stringsAsFactors = FALSE)
    tidy_4b <- data.frame("SITTING", phone_column_names[3:80], unname(tidy_4), stringsAsFactors = FALSE)
    tidy_5b <- data.frame("STANDING", phone_column_names[3:80], unname(tidy_5), stringsAsFactors = FALSE)
    tidy_6b <- data.frame("LAYING", phone_column_names[3:80], unname(tidy_6), stringsAsFactors = FALSE)
    
    # Next we relabel the columns in each data frame to make merging easier.
    
    colnames(tidy_1b) <- c("Activity", "Measurement", "Mean Value")
    colnames(tidy_2b) <- c("Activity", "Measurement", "Mean Value")
    colnames(tidy_3b) <- c("Activity", "Measurement", "Mean Value")
    colnames(tidy_4b) <- c("Activity", "Measurement", "Mean Value")
    colnames(tidy_5b) <- c("Activity", "Measurement", "Mean Value")
    colnames(tidy_6b) <- c("Activity", "Measurement", "Mean Value")
    
    # Finally, we merge the six data frames into a single tidy data frame,
    # and use write.table to output it to a file.

    tidy_phone_data = merge(tidy_1b, tidy_2b, all.x = TRUE, all.y = TRUE)
    tidy_phone_data = merge(tidy_phone_data, tidy_3b, all.x = TRUE, all.y = TRUE)
    tidy_phone_data = merge(tidy_phone_data, tidy_4b, all.x = TRUE, all.y = TRUE)
    tidy_phone_data = merge(tidy_phone_data, tidy_5b, all.x = TRUE, all.y = TRUE)
    tidy_phone_data = merge(tidy_phone_data, tidy_6b, all.x = TRUE, all.y = TRUE)
    
    write.table(tidy_phone_data, file="tidy_phone_data.txt", row.names = FALSE)