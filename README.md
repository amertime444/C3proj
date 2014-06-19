C3proj
======
This is Amer's Course Project for Coursera's Getting and Cleaning Data. 
This README file will explain the "run_analysis.R" script provided in this repository. 
The skinny, tidy data output of the "run_analysis.R" was provided in the first part of 
the Course Project Submission.

NOTE: The "run_analysis.R" file is carefully documented as well. 

Assuming that the main directory contains the "Samsung data" in the working directory.

#Data Preparation:
 A. Read TRAIN and TEST text files into R as data frames through the read.table function.
Example 
```
x_train <- read.table("./train/X_train.txt", sep = "")
```

 B. Create TRAIN and TEST data frames by combining subjects, acitivity, and variable data.
 Example
```
 traindf <- cbind(subj_train, y_train, x_train)
```

#Part 1 of Course Project: 
 Merge training and test sets to create one data set.
 All the data is merged together with training data on top and test data below.
 Columns are then renamed to ensure unique, understandable column names
 Example
```
 labels <- read.table("./activity_labels.txt", sep="")       ## activity numbers and corresponding activity
names(labels)[1] <- paste("act.num")
names(labels)[2] <- paste("act.name")
```

#Part 3 of Course Project:
 Use descriptive activity names to name activities in data set;
### 1. Read ACTIVITY LABELS text file
### 2. Merge activity labels with numbers
### 3. Rearrange columns to make most sense (col 1 = activity name, col 2 = subject)

#Part 4 of Course Project:
 Use descriptive variable names to name variables in data set;
### 1. Read VARIABLE LABELS text file
### 2. Merge variable labels with V1-V561 column headings

#Part 2 of Course Project:
 Check for "mean()" and "std()" in column names; then creates a new data frame containing those variables only.
### 1. Use grepl to find approximate text matches
### 2. ensure that activity name and subject columns are maintained
### 3. Create new data frame containing activity name, subject, and variables with "mean()" or "std()"

#Part 5 of Course Project:
 Melt and cast the data frame to create a skinny, tidy data frame
### 1. MeltALL data into a skinny data frame
### 2. Cast data per activity AND subject, by evaluating the MEAN for each case 
### 3. Melt again to create a SKINNY, TIDY Data Frame with the MEANS of the required variables for each SUBJECT AND ACTIVITY.



 
