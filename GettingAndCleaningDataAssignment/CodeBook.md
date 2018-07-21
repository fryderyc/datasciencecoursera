# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that has performed to clean up the data

## Data source

* Data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Full description of the dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The data

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


## Unused data

The following files in folders "train/Inertial Signals" and "test/Inertial Signals" are not used in this project.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Analysis process

0. The script will automatically download and decompress the source data, and initialise all libraries to be used.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables and summaries calculated
With reference to the Analysis process steps listed above -
1. X_merged: the data set merged from the training and the test set
2. X_merged: the same data set as in step 1, but with the measurements on mean and standard deviation extracted
3. y_merged: the activity data set, with descriptive activity names
4. X_merged and y_merged: the same data sets as above, but with descriptive variable names extracted from features.txt
5. tidy: the "tidy" data set that has the mean of data merged from X_merged and y_merged data sets