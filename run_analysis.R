# R codes for Course Project
rm(list=ls())
library(plyr)
library(reshape2)
setwd("C:/Users/Yong/Google Drive/Ph.D/DataScience/Cleanning_Data/UCI")
source("run_analysis.R")


# 1. Merges the training and the test sets to create one data set.
## import training set
X <- read.table("./train/X_train.txt")
y <- read.table("./train/y_train.txt")
id <- read.table("./train/subject_train.txt")
## import test set
Xt <- read.table("./test/X_test.txt")
yt <- read.table("./test/y_test.txt")
idt <- read.table("./test/subject_test.txt")
## merge 
Xa <- rbind(X,Xt)
ya <- rbind(y,yt)
ida<- rbind(id,idt)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
## import feature data
feature <- read.table("features.txt")
## extract names of feature
fn <- (t(feature))[2,]
names <- gsub("\\(|\\)", "", fn)
## assign column names to X dataframe
colnames(Xa) <- names
## subset the measurements on the mean and std from X dataframe
Xs <- subset(Xa,select = grepl("mean|std", names(Xa)))
Xs1 <- Xs[,!grepl("meanFreq",names(Xs))]

# 4. Appropriately labels the data set with descriptive variable names. 
## assign column name to y dataframe
colnames(ya) <- "activity"
## assign column name to subject dataframe
colnames(ida) <- "SubjectID"

# 5. Creates a second, independent tidy data set with the average of each variable for each activity 
# and each subject. 
clean <- cbind(ida,ya,Xs1)
melted <- melt(clean, id.vars=c("SubjectID", "activity"))
Average <- ddply(melted, c("SubjectID", "activity","variable"), summarise,
           mean = mean(value))
write.table(Average,file="tidy_data_set_with_the_averages.txt")

