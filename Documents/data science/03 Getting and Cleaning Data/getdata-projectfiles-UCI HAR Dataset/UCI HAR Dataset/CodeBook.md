#Getting and Cleaning Data Project

Enrique R. Perezyera Benoit

##Source Data

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Source Data zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attribute Information

For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

##Section 1. Merge the training and the test sets to create one data set.

A: Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
B: Values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
C: Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
	C.1: Names of Varibles Features come from “features.txt”


We will use Activity, Subject and Features as part of descriptive variable names for data in data.


In A we will load the Activity data sets, row bind them and name the column. (Activity Data)

In B we will load the Subject data sets, row bind them and name the column. (Subject Data)

In C we will load the Features data sets and row bind them. (Features Data)

In C.1 we will load the variable names in "features.txt" and assign its column (which contains all the variable names) as the variable name to our Features data set.

After loading the Activity data, Subject data and Features data we will column bind them to form a huge data frame with all information.


##2. Extract only the measurements on the mean and standard deviation for each measurement.


We will subset our enormous data frame to include "Subject", "Activity", ".-mean", ".-standard deviation" variables.


##3. Use descriptive activity names to name the activities in the data set.


Load the activity labels file (activity_labels.txt)! In order to describe each activity we'll name the columns of the data set "activityid" and "activitytype" and merge this tiny data set (by "activityid") with our ridiculously big data frame (by "activity").


##4. Appropriately label the data set with descriptive activity names.


Use the function gsub to name our variables appropriately.


##5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


That's just three lines of code!



That will be all!! 