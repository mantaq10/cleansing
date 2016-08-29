# Getting and Cleansing Data
## UCI Human Activity Recognition Data Set
### Tidy Data Set Script

This repository refers to the final project of the course "Getting and Cleaning Data" on Coursera's Data Science Specialization.

These repo contains the original data set that is referred from UCI Machine Learning Repository http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones titled "Human Activity Monitoring Using Smartphones Data". 

The purpose of the project is to create a tidy data set from the source in a single R Script, "Run_Analysis.R". 

The code performs the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Running the Code
- Make sure you unzip the data set folder
- Make sure you update the folder location in the variable 'folder'. 
- Make sure the dplyr package is installed. 
- The final data set is 'finalTidyData'
- It contains 35 rows and 68 columns
