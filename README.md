==================================================================
R Script for generating a summary dataset of the "Human Activity Recognition Using Smartphones" Data
==================================================================
Developed for the project of the Coursera Getting and Cleaning Data course
Dean Higham, April 2015

==================================================================
Background:
===========
Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The run_analysis function performs a series of steps to:
1. Check the original data files are located in the working directory of R with all file names and sub-directories unchanged.
2. Read and merge the original data files.
3. Correctly label all features and activities as per the original data to maintain the integrity of the original experimental data.
4. Subset the data to only include information on the subject, activity and all features related to mean and standard deviation measurements.
5. Output a tidy summary .txt data file that provides the mean for each set of subject, activity, and feature.

The dataset includes the following files:
=========================================

- 'README.md': This file explaining the dataset background, R script function purpose, and additional notes.

- 'CodeBook.md': Code book describing the variables, the data, and the transformations performed to generate the summary data.

- 'run_analysis.R': R script to be run to generate the summary dataset.

- 'tidydata.txt': Output summary data showing the mean for each set of subject, activity, and feature. 

Notes: 
======
- To function correctly, the run_analysis script requires the original data files have been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into the R working directory with file names and sub-directories maintained.
- The run_analysis script requires the "dplyr" package to be installed prior to the function being run. If the package is not already installed it can be installed to the R library using this command: install.packages("dplyr")
- The output data file (by default named "tidydata.txt") complies with the principles of tidy data. The dataset has one column for each variable (including headers) and each row represents one observation.
- To read the output file back in and view the data in R, the following commands should be used, where "file.path" is the path to the output file ("tidydata.txt" by default):
data <- read.table(file.path, header = TRUE)
View(data)

For more information about the original dataset see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

License:
========
Use of the original dataset in publications must be acknowledged by referencing the following publication: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
