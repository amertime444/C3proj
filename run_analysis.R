## Assuming the files have been unzipped in the current working directory

## Read TRAIN text files into individual data frames
x_train <- read.table("./train/X_train.txt", sep = "")            ## 561 columsn, 7352 rows
y_train <- read.table("./train/Y_train.txt", sep ="")             ## 1 column, 7352 rows
subj_train <- read.table("./train/subject_train.txt", sep ="")    ## 1 column, 7352 rows

## Read TEST text files into individual data frames
x_test <- read.table("./test/X_test.txt", sep = "")         ## 561 columns 2947 rows
y_test <- read.table("./test/Y_test.txt", sep = "")         ## 1 column 2947 rows
subj_test <- read.table("./test/subject_test.txt", sep ="") ## 1 column 2947 rows

## Create a TRAIN data frame -> Column 1: Subject, COlumn 2: Activity, Column 3 onwards: Data
traindf <- cbind(subj_train, y_train, x_train)

## Create a TEST data frame -> Column 1: Subject, COlumn 2: Activity, Column 3 onwards: Data
testdf <- cbind(subj_test, y_test, x_test)

## PART 1 of Course Project: Merge training and test sets to create one data set
## All data merged together with training data on top and test data below in one large set
## Column 1: Subject, COlumn 2: Activity, Column 3 onwards: Data
df <- rbind(traindf, testdf)
names(df)[1] <- paste("subj") ## to ensure that column names are clear and unique
names(df)[2] <- paste("act.num")  ## to ensure that column names are clear and unique

## PART 3 of Course Project: Use descriptive activity names to name activities in data set
## 3A) Read ACTIVITY LABELS text file 
labels <- read.table("./activity_labels.txt", sep="")       ## activity numbers and corresponding activity
names(labels)[1] <- paste("act.num")
names(labels)[2] <- paste("act.name")

## Merges activity labels with numbers. 
## NOTE: Acitivity Number becomes Column 1, Acitivty Name = last column
df <- merge(df, labels, by.x = "act.num", by.y = "act.num") 
## rearranges such that col1 = activity name, col 2 = subject, and deletes activity number
df <- df[,c(ncol(df), 1:(ncol(df)-1))]
df$act.num <- NULL

## PART 4 of Course Project: Use descriptive variables names to name variables in data set
## Read VARIABLE LABELS text file and rename columns 
feat <- read.table("./features.txt", sep="")       ## feature numbers and corresponding feature
colnames(df)[3:dim(df)[2]] <- as.character(feat$V2)      ## renames columns V1-V561 to the corresponding feature name

## PART 2: Check for "mean()" and "std()" in column names
mean.std.check <- (grepl("mean()", colnames(df)), fixed = TRUE) + (grepl("std()", colnames(df)), fixed = TRUE)
mean.std.check[1] <- 1 ## ensures that activity label column is maintained
mean.std.check[2] <- 1 ## ensures that subject number column is maintained

## Creates new data frame with Activity Name, Subject Number, and Paramters that are Mean/StDevs
dfnew <- df[ ,mean.std.check == 1]


meltdf <- melt(dfnew, id=c("subj", "act.name")) ## creates a skinny DF ordered by activity.name
meltdf <- meltdf[order(meltdf$subj, meltdf$act.name),] ## orders the skinny DF by subject, then activity

finaldf <- dcast(meltdf, act.name + subj ~ variable, mean) ## casts per activity and subject, the mean of each variable
finaldf <- melt(finaldf, id=c("subj", "act.name")) ## create a tidy/narrow output
