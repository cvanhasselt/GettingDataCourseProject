# Getting and Cleaning Data Course Project

The Course Project uses data from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To reproduce the steps described below, and to use the run_analysis.R file, you need to download the
above zip file, decompress the file, and have the run_analysis.R file in the top level folder of the unzipped 
package.

## Overall Process

The five essential tasks to complete the Course Project are as follows.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject.

These five steps will be accomplished via the process described below. Readers should also
examine the codebook, and the full comments in the run_analysis.R file.

## 1. -- Merge training and test sets to create one data set.

First, I read in the data, label set, and subject codes for the test data. A similar block
of code is used to read in the train data.

```
xtestdata    <- read.table("./test/x_test.txt")         # data
ytestdata    <- read.table("./test/y_test.txt")         # labels
testsubjects <- read.table("./test/subject_test.txt")   # subjects
```

I then merge the two raw data tables together, row-wise.  Also, the activity label codes and subject
codes are merged.
```
yData <- rbind(xtestdata,xtraindata)
allLabelSets    <- rbind(ytestdata,ytraindata)
allSubjectCodes <- rbind(testsubjects,trainsubjects)
```

Note that I've taken car to always merge in the order test, train.  It is important to do this consistently
to maintain the row-order of the various data files.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

First, I read in the feature names from the features.txt file.  
```
featurenames   <- read.table("./features.txt")
```
Then, I identify all the features that are either standard deviations or means of measurements, via
a grep transformation.  I've assumed that the measures of interest are those containing either a "-std()" or
a "-mean()" text string within the original feature names.
```
meanandstddevfeatures  <- grepl("(-std\\(\\)|-mean\\(\\))",featurenames$V2)
```
Finally, I  remove columns that are not means or standard deviation features, based on the list identified above.
```
filteredActivityData <- allActivityData[, which(meanandstddevfeatures == TRUE)]
```

## 3. Uses descriptive activity names to name the activities in the data set.

I read the set of activity labels from the activity_labels.txt file, then convert the 
labe codes to a factor that can be then transformed into a text string.  I don't worry about underscores, because
I don't find that to be a "untidy" distraction.
```
activityLabels  <- read.table("./activity_labels.txt")
activity <- as.factor(allLabelSets$V1)
levels(activity) <- activityLabels$V2
```
Next, I transform the subject codes to factors, for later use.
```
subject <- as.factor(allSubjectCodes$V1)
```
Finally, I bind the subject and activity to the filteredActivityData dataset.
```
filteredActivityData <- cbind(subject,activity,filteredActivityData)
```

## 4. Appropriately label the data set with descriptive variable names. 

In this step, the mean and standard deviation feature names are cleaned of hyphens and parentheses, and then attached as column names to the data set.  The previously used meanandstddevfeatures true/false vector is used to capture the names of all the mean and standard deviation features.
```
filteredfeatures <- (cbind(featurenames,meanandstddevfeatures)[meanandstddevfeatures==TRUE,])$V2
```

Using a gsub regular expression replacement I clean the parenthesese and hyphens, and make the name lowercase. The function cleaner does the cleaning, and sapply is used to apply the function to all desired featurenames.

```
cleaner <- function(featurename) {
    tolower(gsub("(\\(|\\)|\\-)","",featurename))
}
filteredfeatures <- sapply(filteredfeatures,cleaner)
```

# Finally, add the filteredfeature names to the filteredActivityData set. The first column name is
# skipped, since it already has a name, provided in step 3 above.
names(filteredActivityData)[3:ncol(filteredActivityData)] <- filteredfeatures

# write the final dataset to a CSV file, and as a text file
write.csv(filteredActivityData,file="dataset1.csv")
write.table(filteredActivityData, "dataset1.txt", sep="\t")

#--------------------------------------------------------------------------------------------
# 5.-- Creates a second, independent tidy data set with the average of each
#      variable for each activity and each subject.  (note:  This is where my comfort level
#      with this class seriously falls apart.)

# using the reshape2 library, use the melt function to collapse the filteredActivityData dataframe.
library(reshape2)

# create the molten data set
molten <- melt(filteredActivityData,id.vars=c("subject","activity"))

# cast the molten data set into a collapsed tidy dataset
tidy <- dcast(molten,subject + activity ~ variable,mean)

# write the dataset to a file
write.table(tidy, "dataset2.txt", sep="\t")


