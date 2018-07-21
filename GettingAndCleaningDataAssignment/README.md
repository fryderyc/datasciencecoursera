# Getting and Cleaning Data Course Project

## Script
* run_analysis.R

## Script running procedure

1. The script will automatically download and use the dependent libraries as listed in the "Dependencies" section.
2. The script downloads the data set as a compressed "data.zip" file, and decompresses it into a folder "UCI HAR Dataset"
3. The script will typically run for around 15-20 seconds, and write a file "tidy_data.csv" which contains the merged and tidy data.

## Dependencies
* reshape2
* data.table