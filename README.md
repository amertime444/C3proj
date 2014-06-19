C3proj
======
This is Amer's Course Project for Coursera's Getting and Cleaning Data.
This README file will explain the "run_analysis.R" script provided in this repository. 
The skinny, tidy data output of the "run_analysis.R" was provided in the first part of 
the Course Project Submission.

NOTE: The "run_analysis.R" file is carefully documented as well. 

Assuming that the main directory contains the "Samsung data" in the working directory.

Data Preparation:
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

 
 Part 1 of Course Project: Merge training and test sets to create one data set.
 All the data is merged together with training data on top and test data below.
 Columns are then renamed to ensure unique, understandable column names
 Example
```
 labels <- read.table("./activity_labels.txt", sep="")       ## activity numbers and corresponding activity
names(labels)[1] <- paste("act.num")
names(labels)[2] <- paste("act.name")
```


 
