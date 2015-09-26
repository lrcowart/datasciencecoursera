---
title: "Course 3 project"
author: "lrcowart"
date: "Sunday, September 20, 2015"
output: html_document
---

run_analysis.R is broken down into five sections.

**PREREQUISITE: WORKING DIRECTORY**

The script assumes that R's working directory holds the unzipped "UCI HAR Dataset" folder with all the data.

**SECTION 1: Merging the data**

The general idea is to merge the training and testing set data for test subjects, for activity codes, and for measurements, then combine each of those three into a single data frame. 

subject_train and subject_test are used to read in the train and test data for the subject numbers, and *subject*, made with rbind, holds the combination of the two.

y_train and y_test are used to read in the train and test data for the activity code, and *y*, made with rbind, holds the combination of the two.

X_train and X_test are used to read in the train and test data measurements, and *X*, made with rbind, holds the combination of the two.

Finally, phone_data_raw uses data.frame to combine *subject*, *y*, and *X* into a single data frame.

**SECTION 2: Removing data other than means and standard deviations**

Using Excel, I identified the column numbers of the measurements that were either means or standard deviations. These are described in codebook.md. Using this information, I manually created a numeric vector, columns_kept, with these numbers. phone_data consists only of the columns of phone_data_raw with these columns, as well as the leading columns for subject number and activity code.

**SECTION 3: Adding useful activity names**

This section uses six sub statements to replace the numbers in column 2 of phone_data (y, the activity code, was created to be in column 2 in Section 1) with their descriptions as given in activity_labels.txt.

**SECTION 4: Adding useful descriptions to the columns**

This section involves the manual creation of phone_column_names, a string vector with descriptive column names for the measurement data. I used Excel to substitute underscores ("_") for dashes ("-") and remove open-and-closed parenthesis, as well as to generate the quotes and commas so I wouldn't have to type the whole thing. 

A colnames statement assigns this to the column names of phone_data. 

**SECTION 5: Creating the tidy data set to upload to Coursera**

The goal is to generate a tidy data set, one in which there is exactly one observation per row, no more or less. We also want to collapse the observations for each activity type and measurement type into a single mean. A sensible ordering is the activity code in the first column, the name of the thing measured is in the second column, and the mean of the measurements is in the third column. 

*Phase 1: calculating the means*

We use activ_1 to subset phone_data for only the "WALKING" data, and use the apply statement to create tidy_1, a numeric vector with all the means for the various observation types for that activity.

Repeat this for activ_2 through activ_6 and tidy_2 through tidy_6.

*Phase 2: generate a data frame for each activity type*

Recall that we want to have 3 columns: activity name, measurement name, and the mean. Three further observations are helpful:

* We already have the names for the measurements in phone_column_names. But that vector contains two leading strings, "Subject" and "Activity", that we don't need. So we can use phone_column_names[3:80] to remove those.
* Because of the way they were created, tidy_1 through tidy_6 are named numbers, meaning that they carry along row or column names. We don't want that, so we will pass the tidy_n variables through unnamed(). 
* We (presumably) want to preserve the name of each activity rather than allowing it to be collapsed into a factor, so we want to use stringsAsFactors = FALSE.

Thus, tidy_1b <- data.frame("WALKING", phone_column_names[3:80], unname(tidy_1), stringsAsFactors = FALSE) will give us what we want for the first activity. Repeat for tidy_2b through tidy_6b, substituting the relevant activity names.

*Phase 3: column names*

Merging will be much easier if the column names match, so we have six statements, one for each activity type, that change the column labels to "Activity", "Measurement", and "Mean Value".

*Phase 4: merging and outputting*

A default merge will be mostly fine, but because there is no overlap, it's crucial to include all.x = TRUE and all.y = TRUE. 

There are a total of five merge statements, each of which merges the previous result with the next activity's data.

Finally, with the write.table command, default parameters are mostly fine, but we don't want row names.

That's it! Thanks for reading, and best of luck in your coursework.