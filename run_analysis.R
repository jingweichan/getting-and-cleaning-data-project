## 0. Preprocessing steps
# Load the necessary libraries
library(plyr)

# Read the files and load into tables
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)

activities <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)

## 1. Merges the training and the test sets to create one data set.
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

all <- cbind(x_all, subject_all, y_all)

# Set the column names
colnames(all) <- c(as.character(features$V2), "subject", "activity")

## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
# Get columns with mean or std
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Add subject and activity columns
neededCols <- c(mean_and_std, 562, 563)

# Get subset of data
all <- all[, neededCols]

## 3. Uses descriptive activity names to name the activities in the data set
# Change activity to be more descriptive using activity_labels.txt
all$activity[all$activity == 1] <- as.character(activities[1, 2])
all$activity[all$activity == 2] <- as.character(activities[2, 2])
all$activity[all$activity == 3] <- as.character(activities[3, 2])
all$activity[all$activity == 4] <- as.character(activities[4, 2])
all$activity[all$activity == 5] <- as.character(activities[5, 2])
all$activity[all$activity == 6] <- as.character(activities[6, 2])

## 4. Appropriately labels the data set with descriptive variable names.

## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
tidy <- aggregate(all[, 1:66], by = list(activity = all$activity, subject = all$subject), mean)
write.table(tidy, "tidy.txt", row.name = FALSE)