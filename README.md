Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R code and documentation files for the course project of"Getting and Cleaning data".

The dataset used here represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site at:  

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The data for the project can be found at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Files

`run_analysis.R` contains all the code to perform the following 5 steps below. It can be launched in RStudio by just importing the file. The data should be placed in the same directory.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.



