Step 1
=================================
- Load library dplyr
- Create string of data location

Step 2
=================================
Load the data files
- activity_labels: loaded the numeric codes for each activity the subject did (ex. code 1 is walking, code 2 is waling upstairs)
    - The columns are renamed to code (numeric value) and acitivity (string of description).
- features: the feature names are loaded assigned to features.  These are descriptions of 561 variables that was measured.
    - The columns are renamed to code (numeric value) and feature
- subject_test: for each observation shows the number assigned to each subject in the testing data
- X_test: observation for each variable (2947 x 561 matrix) from testing data
- y_test: the activity code for each observation (2947 x 1 vector) from testing data
- subject_train: for each observation shows the number assigned to each subject in the training data
- X_train: observation for each variable (2947 x 561 matrix) from training data
- y_train: the activity code for each observation (2947 x 1 vector) from training data

Step 3
=================================
Merge data

- X_data: rbind the X_test and X_train 
- y_data: rbind the y_test and y_train 
- subject: rbind subject_test and subject_train
- mergedData: cbind subject, y_data, and X_data into one dataframe (10299 x 563 matrix)
- label the columns with the first column being subject, the second column being activity, and the rest of the columns labelled according to features.

Step 4
==================================
- Find only the features that contained the word mean or std and created new variable "tidyData" with those features.
- Some of the feature names were cleaned up so that:
  - Acc --> Acceleration
  - mean --> Mean
  - std --> STD
  - BodyBody --> Body
  - t --> Time
  - f --> Freq
  - Freq() --> Freq
- The descriptive activity lables replaced the code in the second column of tidyData

Step 5
==================================
- avg_tidyData: A pipline was used to group the tidyData by subject number and activity and found the mean of all the variables.
- avg_tidyData was saved to a text file using write.table().
