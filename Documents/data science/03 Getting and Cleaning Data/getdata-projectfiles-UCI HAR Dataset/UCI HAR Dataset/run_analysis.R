######################################################

#Getting and Cleaning Data Course Project
#Enrique R. Perezyera Benoit

#File description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set.
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

########################################################

rm(list=ls()) #Clean your workspace dude. (This will make reading easier)

# Set your working Directory to where you unpacked the Dataset.

setwd('c:/Users/ebenoit/Documents/data science/03 Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset');

###########################################################

# 1. Merge the training and the test sets to create one data set.
  
  # A: Values of Varible Activity consist of data from "Y_train.txt" and "Y_test.txt"
  # B: Values of Varible Subject consist of data from "subject_train.txt" and subject_test.txt"
  # C: Values of Varibles Features consist of data from "X_train.txt" and "X_test.txt"
  # C.1: Names of Varibles Features come from "features.txt"
  
#So we will use Activity, Subject and Features as part of descriptive variable names for data in data 

# A: Load Activity data sets, row bind them and name the freaking column.

activitytest <- read.table("./test/y_test.txt", header=FALSE);
activitytrain <- read.table("./train/y_train.txt", header=FALSE);

  dataactivity <- rbind(activitytrain,activitytest)

    names(dataactivity) <- c("activity")


# B: Load Subject data sets, bind those mofos and name the column.

subjecttrain <- read.table("./train/subject_train.txt", header=FALSE);
subjecttest <- read.table("./test/subject_test.txt", header=FALSE);

  datasubject <- rbind(subjecttrain, subjecttest)

    names(datasubject) <- c("subject")




# C: Load the hideous Features data sets, bind them and name them using the features.txt.
xtest <- read.table("./test/X_test.txt", header=FALSE);
xtrain <- read.table("./train/X_train.txt", header=FALSE);

  datax <- rbind(xtrain,xtest)

    # C.1: Name "datax" columns via loading and extracting "features.txt".
    dataxnames <- read.table("./features.txt", header=FALSE);
    names(datax) <- dataxnames$V2


#Merge columns to get a humping huge data frame.

subjectactivity <- cbind(datasubject,dataactivity) #Merges columns from "datasubject" and "dataactivity".

Data <- cbind(datax,subjectactivity) #You are smart enough to see what I'm doing here!

################################################

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# Subset "dataxnames" (which until now includes all variables) to only mean and std. (Means standard deviation and not sexual transmitted deseases!)

subdatax <- dataxnames$V2[grep("mean\\(\\)|std\\(\\)", dataxnames$V2)] #grep fct looks for everything that has a "mean" and "std" in the datxnames column.


# Create a data frame that includes "subject", "activity" and subsettes dataxnames.

subject_activity_subdatax <- c("subject","activity",as.character(subdatax));

Data <- subset(Data, select=subject_activity_subdatax);

###############################################################

# 3. Use descriptive activity names to name the activities in the data set.

# Levels of the Varible Activity come from "activity_labels.txt"

# Load the activity labels file (activity_labels.txt) in order to describe each activity.

activitylabels <- read.table("./activity_labels.txt", header=FALSE);

colnames(activitylabels) <- c("activityid", "activitytype") # Assigns the names "activityid" and "activitytype" to what otherwise would've been V1 and V2.

Data = merge(activitylabels, Data, by.x="activityid", by.y="activity", all=TRUE); # Merges the recently loaded data into a very nice data frame.

###############################################################

# 4. Appropriately label the data set with descriptive activity names.

# t = time | Acc = Accelerometer | Gyro = Gyroscope | f = frequency | Mag = Magnitude | BodyBody = Body

names(Data) <- gsub("^t", "time", names(Data));
names(Data) <- gsub("Acc", "Accelerometer", names(Data));
names(Data) <- gsub("Gyro", "Gyroscope", names(Data));
names(Data) <- gsub("^f", "frequency", names(Data));
names(Data) <- gsub("Mag", "Magnitude", names(Data));
names(Data) <- gsub("BodyBody", "Body", names(Data))


#################################################################

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr); #Package using the split apply combine pattern.
Final_data<-aggregate(. ~subject + activitytype, Data, mean)
Final_data<-Final_data[order(Final_data$subject,Final_data$activitytype),]

# Extract the data frame into a horrible and useless txt file.
write.table(Final_data, file="Final_data.txt", row.name=FALSE)

# Well done little fucker!! After you copy paste it, set the right setwd() command and change the name to your own you can go back to whatever floats your boat!

