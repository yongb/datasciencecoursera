datasciencecoursera
===================
## Getting and Cleaning Data Course Project

The dataset includes the following files:
=========================================

- 'README.txt': a file describing how the script works.

- 'CodeBook.md': a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

- 'run_analysis.R': one R script that does the following:  

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

About the script and the tidy dataset:
=========================================
* Download the data source from website 
  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Unzip zip file into a work folder on your local drive. i.e. 
  (C:/Users/Yong/Google Drive/Ph.D/DataScience/Cleanning_Data/UCI)

* Put run_analysis.R to the same folder 
  (C:/Users/Yong/Google Drive/Ph.D/DataScience/Cleanning_Data/UCI)

* Install packages "plyr" and "reshape2" if you haven't done before

* Run the R script, it will output the data file below:

  tidy_data_set_with_the_averages.txt
