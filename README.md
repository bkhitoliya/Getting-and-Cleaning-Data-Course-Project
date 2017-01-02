Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The R script, run_analysis.R, does the following:

1. Load the activity and feature info
2. Load both the training and test datasets
3. All the variables are given name from feature info.(except for activity and volunteer)
4. Merge both datasets
5. The merged dataset obtained in step 4 will be extracted to only the variable name with mean() or std() and activity and volunteer only.Volunteer is represented with V1 in this step. It will be renamed later.
6. The results in activity column is replaced from id to text and it is made a factor field
7. Rename the V1 column to volunteer and also other operation is performed to make all the variable names tidy
8. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
9. The end result is shown in the file tidy.txt.

P.S.: Download the zipped file in the home directory. And extract it in UCI HAR Dataset folder. Download file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"