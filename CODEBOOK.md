#CODEBOOK
This codebook describes the data in summarized_data.txt

##Data Source
Detailed information of the data source can be found at:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data can be downloaded from: 

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Transformations made to Data
Several transformations were made to the data:

1. The test and training data ```X_train``` and ```X_test``` were transformed:

	* only the mean and standard deviation of variables were chosen from the 561 feature vector
	* The subject's ID was added as the first column of the new dataset
	* The activity labels were added as the second column of the new dataset

2. The training and test data were merged together

	* test data was appended to the bottom of the training data

3. The merged data was grouped by subject and activity and each variable was summarized by their mean using the following code snippet.

	```r
	summarizeData<-function(data){
	  #summarizes data by subject and activity
	  data %>%
	    group_by(subject,activity) %>%
	    summarise_each(funs(mean))
	}
	```
4. The resulting summarized data was saved as summarized_data.txt in the output folder.

#Variables

The resulting dataset has 180 records each with 68 variables

>- subject
- activity
- time.BodyAcc.mean.X
- time.BodyAcc.mean.Y
- time.BodyAcc.mean.Z
- time.BodyAcc.std.X
- time.BodyAcc.std.Y
- time.BodyAcc.std.Z
- time.GravityAcc.mean.X
- time.GravityAcc.mean.Y
- time.GravityAcc.mean.Z
- time.GravityAcc.std.X
- time.GravityAcc.std.Y
- time.GravityAcc.std.Z
- time.BodyAccJerk.mean.X
- time.BodyAccJerk.mean.Y
- time.BodyAccJerk.mean.Z
- time.BodyAccJerk.std.X
- time.BodyAccJerk.std.Y
- time.BodyAccJerk.std.Z
- time.BodyGyro.mean.X
- time.BodyGyro.mean.Y
- time.BodyGyro.mean.Z
- time.BodyGyro.std.X
- time.BodyGyro.std.Y
- time.BodyGyro.std.Z
* time.BodyGyroJerk.mean.X
* time.BodyGyroJerk.mean.Y
* time.BodyGyroJerk.mean.Z
* time.BodyGyroJerk.std.X
* time.BodyGyroJerk.std.Y
* time.BodyGyroJerk.std.Z
* time.BodyAccMag.mean
* time.BodyAccMag.std
* time.GravityAccMag.mean
* time.GravityAccMag.std
* time.BodyAccJerkMag.mean
* time.BodyAccJerkMag.std
* time.BodyGyroMag.mean
* time.BodyGyroMag.std
* time.BodyGyroJerkMag.mean
* time.BodyGyroJerkMag.std
* freq.BodyAcc.mean.X
* freq.BodyAcc.mean.Y
* freq.BodyAcc.mean.Z
* freq.BodyAcc.std.X
* freq.BodyAcc.std.Y
* freq.BodyAcc.std.Z
* freq.BodyAccJerk.mean.X
* freq.BodyAccJerk.mean.Y
* freq.BodyAccJerk.mean.Z
* freq.BodyAccJerk.std.X
* freq.BodyAccJerk.std.Y
* freq.BodyAccJerk.std.Z
* freq.BodyGyro.mean.X
* freq.BodyGyro.mean.Y
* freq.BodyGyro.mean.Z
* freq.BodyGyro.std.X
* freq.BodyGyro.std.Y
* freq.BodyGyro.std.Z
* freq.BodyAccMag.mean
* freq.BodyAccMag.std
* freq.BodyBodyAccJerkMag.mean
* freq.BodyBodyAccJerkMag.std
* freq.BodyBodyGyroMag.mean
* freq.BodyBodyGyroMag.std
* freq.BodyBodyGyroJerkMag.mean
* freq.BodyBodyGyroJerkMag.std