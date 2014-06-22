##
# The five essential tasks to complete the Course Project are as follows.
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.
#
# These five steps will be accomplished via the R code below.  Appropriate
# details concerning substeps related to these tasks will be included in the
# comments as well.
#
#--------------------------------------------------------------------------------------------
# 1. -- Merge training and test sets to create one data set.

# Read in the data, label set, and subject codes for the test data
xtestdata    <- read.table("./test/x_test.txt")         # data
ytestdata    <- read.table("./test/y_test.txt")         # labels
testsubjects <- read.table("./test/subject_test.txt")   # subjects


# Read in the data,label set, and subject codes for the train data
xtraindata    <- read.table("./train/x_train.txt")       # data
ytraindata    <- read.table("./train/y_train.txt")       # labels
trainsubjects <- read.table("./train/subject_train.txt") # subjects


# merge the two raw data tables together, row-wise.
allActivityData <- rbind(xtestdata,xtraindata)

# merge the two label sets; the labels correspond to activities; these are coded, as integers
allLabelSets    <- rbind(ytestdata,ytraindata)

# merge the two subject codes lists
allSubjectCodes <- rbind(testsubjects,trainsubjects)

#--------------------------------------------------------------------------------------------
# 2. -- Extracts only the measurements on the mean and standard deviation for each measurement.

# Read in the feature names from the features.txt file.  
featurenames   <- read.table("./features.txt")

# identify all the features that are either standard deviations or means of measurements.
# The following code identifies a vector of boolean values that correspond to the means and
# standard deviation measures.
meanandstddevfeatures  <- grepl("(-std\\(\\)|-mean\\(\\))",featurenames$V2)

# remove columns that are not means or std. deviation features
filteredActivityData <- allActivityData[, which(meanandstddevfeatures == TRUE)]

#--------------------------------------------------------------------------------------------
# 3. -- Uses descriptive activity names to name the activities in the data set.

# Read the set of activity labels from the txt file
activityLabels  <- read.table("./activity_labels.txt")

# transform the allLabelSets from integer codes to factors
activity <- as.factor(allLabelSets$V1)

# transform the label factors into a vector of human readable activity descriptions
levels(activity) <- activityLabels$V2

# transform the subject codes to factors, as they will be used as factors later on.
subject <- as.factor(allSubjectCodes$V1)

# bind as a column the allLabels vector to the dataset
filteredActivityData <- cbind(subject,activity,filteredActivityData)

#--------------------------------------------------------------------------------------------
# 4. -- Appropriately label the data set with descriptive variable names.  In this step, the
#       mean and standard deviation feature names are cleaned of hyphens and parentheses, and 
#       then attached as column names to the data set.

# First, the previously used meanandstddevfeatures true/false vector is used to captue the 
# names of all the mean and std. dev. features.
filteredfeatures <- (cbind(featurenames,meanandstddevfeatures)[meanandstddevfeatures==TRUE,])$V2

# Next, a gsub regular expression replacement is used to clean the parenthesese and hyphens, and
# make the name lowercase. The function cleaner does the cleaning, and sapply is used to apply
# the function to all desired featurenames.
cleaner <- function(featurename) {
    tolower(gsub("(\\(|\\)|\\-)","",featurename))
}
filteredfeatures <- sapply(filteredfeatures,cleaner)

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



