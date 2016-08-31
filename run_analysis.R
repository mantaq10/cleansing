library(dplyr);
# Get File
# 
folder <- "/UCI HAR Dataset/";

features <- read.csv(paste(folder, "features.txt", sep = ""), sep = " ", header = FALSE, stringsAsFactors = TRUE);
activityLabels <- read.csv(paste(folder, "activity_labels.txt", sep = ""), sep = " ", header = FALSE, stringsAsFactors = FALSE)

names(activityLabels) <- c("ID", "Label");

folder_train <- paste(folder, "train/", sep = "");
folder_test <- paste(folder, "test/", sep = "");

#Loading Test Data
testSubject <- read.csv(paste(folder_test, "subject_test.txt", sep = ""), sep = "", header = FALSE, stringsAsFactors = FALSE);
testLabel <- read.csv(paste(folder_test, "y_test.txt", sep = ""), sep = "", header = FALSE, stringsAsFactors = FALSE);
testData <- read.csv(paste(folder_test, "X_test.txt", sep = ""), sep = "", header = FALSE, stringsAsFactors = FALSE);

#Loading Training Data
trainSubject <- read.csv(paste(folder_train, "subject_train.txt", sep = ""),  sep = "",header = FALSE, stringsAsFactors = FALSE);
trainLabel <- read.csv(paste(folder_train, "y_train.txt", sep = ""), sep = "", header = FALSE, stringsAsFactors = FALSE);
trainData <- read.csv(paste(folder_train, "X_train.txt", sep = ""), sep = "", header = FALSE, stringsAsFactors = FALSE);

#Merges the training and the test sets to create one data set.
Subject <- rbind(trainSubject, testSubject);
Label <- rbind(trainLabel, testLabel);
Data <- rbind(trainData, testData);
colnames(Data) <- features[,2];

#Extracts only the measurements on the mean and standard deviation for each measurement.
selectedFeatures <- grep("mean\\(\\)|std\\(\\)", features[, 2])
tidyData <- Data[, selectedFeatures];

#Uses descriptive activity names to name the activities in the data set
names(tidyData) <- gsub("mean", "Mean", names(tidyData)) 
names(tidyData) <- gsub("std", "Std", names(tidyData)) 
names(tidyData) <- gsub("-", "", names(tidyData))  
#Appropriately labels the data set with descriptive variable names.
tidyLabel <-  merge(Label, activityLabels, by.x = "V1", by.y = "ID")
tidyLabel <- tidyLabel[,2]
colnames(tidyLabel) <-  'Label'
finalData <- cbind(Subject, tidyData, tidyLabel)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finalTidyData <- group_by(finalData, tidyLabel, V1) %>% summarize_each(funs(mean))
colnames(finalTidyData)[2] <- "Subject"

write.table(finalTidyData, file = "finalTidyData.txt", row.names = FALSE)
