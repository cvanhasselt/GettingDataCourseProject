# Getting and Cleaning Data Course Project

The Course Project uses data from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To reproduce the steps I used to analyze the data, see the README.md file.  This outlines the process I used.  The 
original codebook for the raw data can be found in the zip file above.  The descriptions below refer to dataset2.txt (or .csv) and refer to the data frame produced through the run_analysis.R process, the final tidy data set.

## Column Names

| Name        | Description |
|------------|------------------------------------------|
|subject | A subject number, from 1 to 30|
|activity | An activity label, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
|tbodyaccmeanx | For this column, it is best to refer to the features_info.txt file from the original dataset.  In short, all the following column names that contain  **std** are standard deviation measures, and all that contain **mean** are mean measures. Time variables begin with *t*, time frequency variables begin with *f*. |
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
