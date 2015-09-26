---
title: "codebook"
author: "lrcowart"
date: "Friday, September 25, 2015"
output: html_document
---

**VARIABLES USED IN RUN_ANALYSIS.R**

* activ_1: Data frame subset of phone_data; contains only WALKING measurements.
* activ_2: Data frame subset of phone_data; contains only WALKING_UPSTAIRS measurements.
* activ_3: Data frame subset of phone_data; contains only WALKING_DOWNSTAIRS measurements.
* activ_4: Data frame subset of phone_data; contains only SITTING measurements.
* activ_5: Data frame subset of phone_data; contains only STANDING measurements.
* activ_6: Data frame subset of phone_data; contains only LAYING measurements.
* columns_kept: number vector created manually in section 2 to represent the columns containing mean or standard deviation measurements.
* phone_data: A data frame subset of phone_data_raw keeping only the columns identified in columns_kept. Created in section 2. Its activity codes are revised in section 3 to have their text descriptions instead, and section 4 gives it descriptive column names. Subsets of this data frame are used to create the tidy data file in section 5.
* phone_column_names: String vector created manually in section 4. This is the vector assigned to the column names of phone_data in section 4, and entries 3 through 80 are used to generate the activity names for the tidy data set in section 5. 
* phone_data: Subset of phone_data_raw that includes only the observations that are means or standard deviations. 
* phone_data_raw: Data frame created in section 1 to hold test subjects, activities, and all measurements. 
* subject: num vector used in section 1 to hold the merged vector of subject ID numbers.
* subject_test: num vector used in section 1 to read the subject ID numbers of the test data.
* subject_train: num vector Used in section 1 to read the subject ID numbers in the training data.
* tidy_1: num vector with the means of the measurements in the activ_1 data frame.
* tidy_1b: data frame with the activity name, measurement name, and mean value contained in tidy_1.
* tidy_2: num vector with the means of the measurements in the activ_2 data frame.
* tidy_2b: data frame with the activity name, measurement name, and mean value contained in tidy_2.
* tidy_3: num vector with the means of the measurements in the activ_3 data frame.
* tidy_3b: data frame with the activity name, measurement name, and mean value contained in tidy_3.
* tidy_4: num vector with the means of the measurements in the activ_4 data frame.
* tidy_4b: data frame with the activity name, measurement name, and mean value contained in tidy_4. 
* tidy_5: num vector with the means of the measurements in the activ_5 data frame.
* tidy_5b: data frame with the activity name, measurement name, and mean value contained in tidy_5.
* tidy_6: num vector with the means of the measurements in the activ_6 data frame.
* tidy_6b: data frame with the activity name, measurement name, and mean value contained in tidy_6.
* tidy_phone_data: Data frame; the final tidy data product in section 5. 
* X: table of numbers used in section 1 to store all the measurements. 
* X_test: table of numbers used in section 1 to store the measurements from the test data.
* X_train: table of numbers used in section 1 to store the measurements from the training data. 
* y: number vector used in section 1 to store the merged vector of activity codes. 
* y_test: number vector used in section 1 to read the activity codes for the test data.
* y_train: number vector used in section 1 to read the activity codes for the training data.

**MEASUREMENT DATA RETAINED**

Much of the observations were eliminated, but below are brief descriptions of each measurement type retained:

Variable name | Column in phone_data_raw | Column in phone_data | Description
------------- | -------------------------|----------------------|-------------
tBodyAcc_mean_X|3|3|Mean of X  values in Body Accelerometer, time series
tBodyAcc_mean_Y|4|4|Mean of Y values in Body Accelerometer, time series
tBodyAcc_mean_Z|5|5|Mean of Z values in Body Accelerometer, time series
tBodyAcc_std_X|6|6|Standard deviation of X  values in Body Accelerometer, time series
tBodyAcc_std_Y|7|7|Standard deviation of Y values in Body Accelerometer, time series
tBodyAcc_std_Z|8|8|Standard deviation of Z values in Body Accelerometer, time series
tGravityAcc_mean_X|43|9|Mean of X  values in Gravity Accelerometer, time series
tGravityAcc_mean_Y|44|10|Mean of Y values in Gravity Accelerometer, time series
tGravityAcc_mean_Z|45|11|Mean of Z values in Gravity Accelerometer, time series
tGravityAcc_std_X|46|12|Standard deviation of X  values in Gravity Accelerometer, time series
tGravityAcc_std_Y|47|13|Standard deviation of Y values in Gravity Accelerometer, time series
tGravityAcc_std_Z|48|14|Standard deviation of Z values in Gravity Accelerometer, time series
tBodyAccJerk_mean_X|83|15|Mean of X change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyAccJerk_mean_Y|84|16|Mean of Y change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyAccJerk_mean_Z|85|17|Mean of Z change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyAccJerk_std_X|86|18|Standard deviation of X change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyAccJerk_std_Y|87|19|Standard deviation of Y change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyAccJerk_std_Z|88|20|Standard deviation of Z change (change in acceleration = jerk) in Body Accelerometer, time series
tBodyGyro_mean_X|123|21|Mean of X  values in Body Gyroscope, time series
tBodyGyro_mean_Y|124|22|Mean of Y values in Body Gyroscope, time series
tBodyGyro_mean_Z|125|23|Mean of Z values in Body Gyroscope, time series
tBodyGyro_std_X|126|24|Standard deviation of X  values in Body Gyroscope, time series
tBodyGyro_std_Y|127|25|Standard deviation of Y values in Body Gyroscope, time series
tBodyGyro_std_Z|128|26|Standard deviation of Z values in Body Gyroscope, time series
tBodyGyroJerk_mean_X|163|27|Mean of X change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyGyroJerk_mean_Y|164|28|Mean of Y change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyGyroJerk_mean_Z|165|29|Mean of Z change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyGyroJerk_std_X|166|30|Standard deviation of X change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyGyroJerk_std_Y|167|31|Standard deviation of Y change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyGyroJerk_std_Z|168|32|Standard deviation of Z change (change in acceleration = jerk) in Body Gyroscope, time series
tBodyAccMag_mean|203|33|Mean magnitude of body accelerometer values, time series
tBodyAccMag_std|204|34|Standard deviation of magnitude of body accelerometer values, time series
tBodyAccJerkMag_mean|229|35|Mean change in body accelerometer readings, time series
tBodyAccJerkMag_std|230|36|Standard deviation of changes in body accelerometer readings, time series
tBodyGyroMag_mean|242|37|Mean magnitude of body gyroscope readings, time series
tBodyGyroMag_std|243|38|Standard deviation of body gyroscope readings, time series
tBodyGyroJerkMag_mean|255|39|Mean change in body gyroscope readings, time series
tBodyGyroJerkMag_std|256|40|Standard deviation of changes in body gyroscope readings, time series
fBodyAcc_mean_X|268|41|Mean of X  values in Body Accelerometer, fast Fourier transform
fBodyAcc_mean_Y|269|42|Mean of Y values in Body Accelerometer, fast Fourier transform
fBodyAcc_mean_Z|270|43|Mean of Z values in Body Accelerometer, fast Fourier transform
fBodyAcc_std_X|271|44|Standard deviation of X  values in Body Accelerometer, fast Fourier transform
fBodyAcc_std_Y|272|45|Standard deviation of Y values in Body Accelerometer, fast Fourier transform
fBodyAcc_std_Z|273|46|Standard deviation of Z values in Body Accelerometer, fast Fourier transform
fBodyAccJerk_mean_X|347|47|Mean of X change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_mean_Y|348|48|Mean of Y change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_mean_Z|349|49|Mean of Z change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_std_X|350|50|Standard deviation of X change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_std_Y|351|51|Standard deviation of Y change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_std_Z|352|52|Standard deviation of Z change (change in acceleration = jerk) in Body Accelerometer, fast Fourier transform
fBodyAccJerk_meanFreq_X|375|53|Mean frequency of change in X values of body accelerometer, fast Fourier transform
fBodyAccJerk_meanFreq_Y|376|54|Mean frequency of change in Y values of body accelerometer, fast Fourier transform
fBodyAccJerk_meanFreq_Z|377|55|Mean frequency of change in Z values of body accelerometer, fast Fourier transform
fBodyGyro_mean_X|426|56|Mean  X values of body gyroscope, fast Fourier transform
fBodyGyro_mean_Y|427|57|Mean  Y values of body gyroscope, fast Fourier transform
fBodyGyro_mean_Z|428|58|Mean  Z values of body gyroscope, fast Fourier transform
fBodyGyro_std_X|429|59|Standard deviation of X values of body gyroscope, fast Fourier transform
fBodyGyro_std_Y|430|60|Standard deviation of Y values of body gyroscope, fast Fourier transform
fBodyGyro_std_Z|431|61|Standard deviation of Z values of body gyroscope, fast Fourier transform
fBodyGyro_meanFreq_X|454|62|Mean X frequency of body gyroscope, fast Fourier transform
fBodyGyro_meanFreq_Y|455|63|Mean Y frequency of body gyroscope, fast Fourier transform
fBodyGyro_meanFreq_Z|456|64|Mean Z frequency of body gyroscope, fast Fourier transform
fBodyAccMag_mean|505|65|Mean magnitude of body accelerometer values, fast Fourier transform
fBodyAccMag_std|506|66|Standard deviation magnitude of body accelerometer values, fast Fourier transform
fBodyAccMag_meanFreq|515|67|Mean frequency of body accelerometer, fast Fourier transform
fBodyBodyAccJerkMag_mean|518|68|Mean magnitude of changes to body accelerometer, fast Fourier transform
fBodyBodyAccJerkMag_std|519|69|Standard deviation of magnitude of changes to body accelerometer, fast Fourier transform
fBodyBodyGyroMag_mean|531|70|Mean magnitude of body gyroscope readings, fast Fourier transform
fBodyBodyGyroMag_std|532|71|Standard deviation of  magnitude of body gyroscope readings, fast Fourier transform
fBodyBodyGyroJerkMag_mean|544|72|Mean magnitude of changes to body gyroscope readings, fast Fourier transform
fBodyBodyGyroJerkMag_std|545|73|Standard deviation of changes to body gyroscope readings, fast Fourier transform
fBodyBodyGyroJerkMag_meanFreq|554|74|Mean frequency of changes to body gyroscope readings, fast Fourier transform
angle(tBodyAccJerkMean),gravityMean)|558|75|Average mean change in body accelerometer readings in a signal window sample
angle(tBodyGyroMean,gravityMean)|559|76|average mean of body gyroscope readings in a signal window sample
angle(tBodyGyroJerkMean,gravityMean)|560|77|average mean of changes in body gyroscope readings in signal window sample
angle(X,gravityMean)|561|78|average mean changes in X values in a singal window sample
angle(Y,gravityMean)|562|79|average mean changes in Y values in a singal window sample
angle(Z,gravityMean)|563|80|average mean changes in Z values in a singal window sample
