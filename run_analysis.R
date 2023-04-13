library(dplyr)

data_loc <- "UCI HAR Dataset/"



## load data files

activity_labels <- read.table(paste(data_loc,'activity_labels.txt',sep=''))

names(activity_labels) <- c('code','activity')

features <- read.table(paste(data_loc,'features.txt',sep=''))

names(features) <- c('code','feature')

# test data

subject_test <- read.table(paste(data_loc,'test/subject_test.txt',sep=''))

X_test <- read.table(paste(data_loc,'test/X_test.txt',sep=''))

y_test <- read.table(paste(data_loc,'test/y_test.txt',sep=''))



# train data

subject_train <- read.table(paste(data_loc,'train/subject_train.txt',sep=''))

X_train <- read.table(paste(data_loc,'train/X_train.txt',sep=''))

y_train <- read.table(paste(data_loc,'train/y_train.txt',sep=''))



# merge data



X_data <- rbind(X_train,X_test)

y_data <- rbind(y_train,y_test)

subject <-rbind(subject_train,subject_test)

mergedData <- cbind(subject,y_data,X_data)



#label columns

names(mergedData) <- c('subject','activity',features$feature)





# get only mean or standard deviation from features list



feature_loc <- grep("mean|std",features$feature)



tidyData <- mergedData[, colnames(mergedData)[c(1,2,feature_loc+2)]]



names(tidyData)<-gsub("Acc", "Acceleration", names(tidyData))

names(tidyData)<-gsub("mean\\(\\)", "Mean", names(tidyData))

names(tidyData)<-gsub("std\\(\\)", "STD", names(tidyData))

names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))

names(tidyData)<-gsub("^t", "Time_", names(tidyData))

names(tidyData)<-gsub("^f", "Freq_", names(tidyData))

names(tidyData)<-gsub("Freq\\(\\)", "Freq", names(tidyData))



head(tidyData,n=3)

# add descriptive name to dataset

tidyData$activity <- activity_labels[tidyData$activity,2]



#average variables



avg_tidyData <- tidyData %>% group_by(subject,activity) %>% summarize_at(vars(-c(1,2)), mean)

head(avg_tidyData,n=3)

### Save avg_tidyData as text file.

t <- write.table(avg_tidyData,'avg_tidyData.txt', row.name = FALSE)
