==================================================================
Code Book and Data Dictionary
==================================================================
For use with the run_analysis R script and the "Human Activity Recognition Using Smartphones" dataset

Developed for the project of the Coursera Getting and Cleaning Data course

Dean Higham, April 2015

==================================================================

Background information on the purpose and design of the project, as well as the data collection process of the raw data are shown in the README.md file.
-------------------------------------------------

Creation of the tidy summary output data
-----------

The run_analysis function performs a series of steps to:

1. Check the original data files are located in the working directory of R with all file names and sub-directories unchanged.

2. Read and merge the original data files. The original training data and testing data are first merged separately to include subject, activity and measurement variables. Secondly, the training and testing data are merged to create a single dataframe.

3. Correctly label all features and activities as per the original data to maintain the integrity of the original experimental data.

4. Subset the data to only include information on the subject, activity and all features related to mean and standard deviation measurements. Features related to other measurements, such as minimum, maximum, median, etc. are omitted from the dataframe.

5. Create a tidy summary dataframe that contains the mean for each set of subjects, activity, and feature. Each column represents one variable and each row represents one observation.

6. Output the summary .txt data file in the working directory.

###Notes: 
- To function correctly, the run_analysis script requires the original data files have been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into the R working directory with file names and sub-directories maintained.
- The run_analysis script requires the "dplyr" package to be installed prior to the function being run. If the package is not already installed it can be installed to the R library using this command:
install.packages("dplyr")
- The output data file (by default named "tidydata.txt") complies with the principles of tidy data. The dataset has one column for each variable (including headers) and each row represents one observation.
- To read the output file back in and view the data in R, the following commands should be used, where "file.path" is the path to the output file ("tidydata.txt" by default):

data <- read.table(file.path, header = TRUE)

View(data)

##The output data file (tidydata.txt)
The dataset generated by the run_analysis function conforms to the tidy data principles. Each column represents one variable and each row represents one observation.

The data include column headers with 180 rows (observations) and 88 columns (variables). The data represent the means of 86 feature measurements for each of the 30 subjects and each of the six activities.

###"Subject":
Class = integer

The Subject column represents the subject ID (1-30) for each of the 30 subjects.

###"Activity":
Class = factor

Levels = 1-6

Labels = "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

The Activity variable represents one of the six activities measured in the original data.

###Columns 3-88
Class = numeric

The remaining columns (3-88) represent the subset of features measured in the study as described below. Each value represents the mean normalized value (-1,1) for each subject and activity. There are therefore no units for these normalized values.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle between two vectors:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean