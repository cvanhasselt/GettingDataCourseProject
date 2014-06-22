# Getting and Cleaning Data Course Project

The Course Project uses data from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To reproduce the steps I used to analyze the data, see the README.md file.  This outlines the process I used.  The 
original codebook for the raw data can be found in the zip file above.  The descriptions below refer to dataset2.txt (or .csv) and refer to the data frame produced through the run_analysis.R process, the final tidy data set.

To quote from the features_info.txt file:
```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
```
The column names are direct descendents of these variables, only I have removed distracting hyphens and parentheses.

## Column Names

The table below describes the variables used in dataset2.txt, the dataset produced by the run_analysis.R script.



| Name        | Description |
|------------|------------------------------------------|
|subject | A subject number, from 1 to 30|
|activity | An activity label, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
|tbodyaccmeanx | For this column name and all that follow, it is best to refer to the features_info.txt file from the original dataset.  In short, all the following column names that contain  **std** are standard deviation measures, and all that contain **mean** are mean measures. Time domain variables begin with *t*, time frequency domain variables begin with *f*. Variables containing *acc* refer to acceleration values. ||
|tbodyaccmeany ||
|tbodyaccmeanz ||
|tbodyaccstdx ||
|tbodyaccstdy ||
|tbodyaccstdz||
|tgravityaccmeanx||
|tgravityaccmeany||
|tgravityaccmeanz||
|tgravityaccstdx||
|tgravityaccstdy||
|tgravityaccstdz||
|tbodyaccjerkmeanx||
|tbodyaccjerkmeany||
|tbodyaccjerkmeanz||
|tbodyaccjerkstdx||
|tbodyaccjerkstdy||
|tbodyaccjerkstdz||
|tbodygyromeanx||
|tbodygyromeany||
|tbodygyromeanz||
|tbodygyrostdx||
|tbodygyrostdy||
|tbodygyrostdz||
|tbodygyrojerkmeanx||
|tbodygyrojerkmeany||
|tbodygyrojerkmeanz||
|tbodygyrojerkstdx||
|tbodygyrojerkstdy||
|tbodygyrojerkstdz||
|tbodyaccmagmean||
|tbodyaccmagstd||
|tgravityaccmagmean||
|tgravityaccmagstd||
|tbodyaccjerkmagmean||
|tbodyaccjerkmagstd||
|tbodygyromagmean||
|tbodygyromagstd||
|tbodygyrojerkmagmean||
|tbodygyrojerkmagstd||
|fbodyaccmeanx||
|fbodyaccmeany||
|fbodyaccmeanz||
|fbodyaccstdx||
|fbodyaccstdy||
|fbodyaccstdz||
|fbodyaccjerkmeanx||
|fbodyaccjerkmeany||
|fbodyaccjerkmeanz||
|fbodyaccjerkstdx||
|fbodyaccjerkstdy||
|fbodyaccjerkstdz||
|fbodygyromeanx||
|fbodygyromeany||
|fbodygyromeanz||
|fbodygyrostdx||
|fbodygyrostdy||
|fbodygyrostdz||
|fbodyaccmagmean||
|fbodyaccmagstd||
|fbodybodyaccjerkmagmean||
|fbodybodyaccjerkmagstd||
|fbodybodygyromagmean||
|fbodybodygyromagstd||
|fbodybodygyrojerkmagmean||
|fbodybodygyrojerkmagstd||
