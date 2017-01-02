#variable names for dataset
namesofcol <- read.table("~/UCI HAR Dataset/features.txt", header=FALSE, quote="\"", comment.char = "")

#activity label dataset
activitylabel <- read.table("~/UCI HAR Dataset/activity_labels.txt", header=FALSE, quote="\"", comment.char = "")

#1.Merges the training and the test sets to create one data set.
#Training dataset
trainvol <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
x_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"",header=FALSE, comment.char = "")
names(x_train) <- namesofcol$V2
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt",header=FALSE)
names(y_train) <- c("activity") 

traindataset<- cbind(trainvol,x_train,y_train)

#Test dataset
testvol <- read.table("~/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"",header=FALSE, comment.char = "")
names(x_test) <- namesofcol$V2
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt",header=FALSE)
names(y_test) <- c("activity") 

testdataset <- cbind(testvol,x_test, y_test)

#merged dataset both training and test data
mergeddataset <- rbind(traindataset, testdataset)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#I am including only those variables with only std() and mean()
mean_std <-grep("(mean|std)\\()", names(mergeddataset), value=TRUE)
newdataset <- mergeddataset[,c("V1","activity", mean_std)]

#3. Uses descriptive activity names to name the activities in the data set
newdataset$activity <- factor(newdataset$activity, levels=activitylabel$V1, labels=activitylabel$V2)

#4. Appropriately labels the data set with descriptive variable names.
colnames(newdataset)[1]<- "volunteerid"
names(newdataset)<- tolower(gsub("\\()|-","", names(newdataset)))
#Removing redundant Body
names(newdataset) <- gsub("bodybody","body",names(newdataset))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.
library(dplyr)
summarisedataset <- newdataset
gsummarisedataset <- group_by(summarisedataset, volunteerid, activity)
averagedataset <- summarise_each(gsummarisedataset, funs(mean))
write.table(averagedataset, "tidy.txt", row.name=FALSE)

