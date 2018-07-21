if (!"data.table" %in% installed.packages()) {
  install.packages("data.table")
}
if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}

library("data.table")
library("reshape2")

if (!file.exists("./data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./data.zip", mode = "wb")
  unzip("./data.zip")
}

# 1.  Merges the training and the test sets to create one data set.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_merged <- rbind(X_train, X_test)

# 2.  Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt")
mean_std <- grep("mean()|std()", features[, 2])
X_merged <- X_merged[, mean_std]

# 3.  Uses descriptive activity names to name the activities in the data set
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[, 2]

y_merged <- rbind(y_train, y_test)
y_merged[, 1] <- activity_labels[y_merged[, 1]]

# 4.  Appropriately labels the data set with descriptive variable names.
feature_names <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(X_merged) <- feature_names[mean_std]
names(y_merged) <- "ActivityLabel"

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_merged <- rbind(subject_train, subject_test);
names(subject_merged) <- "Subject"

merged_dataset <- cbind(subject_merged, y_merged, X_merged)

# 5.  From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.
melted <- melt(merged_dataset, id.vars = c("Subject", "ActivityLabel"))
tidy <- dcast(melted, Subject + ActivityLabel ~ variable, mean)
write.csv(tidy, "tidy_data.csv", row.names = FALSE)