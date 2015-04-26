## The run_analysis function assumes all required data files have been
## unzipped into the working directory with no changes to file and
## sub-directory names or locations. If this condition is not met,
## an error is printed and no output file is returned.

run_analysis <- function(output = "tidydata.txt") {
        ## Check if unzipped data files are in the working directory
        if (any(!file.exists(c("./UCI HAR Dataset/train/subject_train.txt",
                                 "./UCI HAR Dataset/train/X_train.txt",
                                 "./UCI HAR Dataset/train/y_train.txt",
                                 "./UCI HAR Dataset/test/subject_test.txt",
                                 "./UCI HAR Dataset/test/X_test.txt",
                                 "./UCI HAR Dataset/test/y_test.txt")))) {
                stop("Data files are missing from the working directory")
        }
        ## Create a list of all training set data files
        files <- paste0("./UCI HAR Dataset/train/",
                        list.files("./UCI HAR Dataset/train/", pattern = ".txt"))
        ## Read in and combine all training set data
        train <- do.call("cbind", lapply(files, read.table))
        ## Create a list of all test set data files
        files <- paste0("./UCI HAR Dataset/test/",
                        list.files("./UCI HAR Dataset/test/", pattern = ".txt"))
        ## Read in and combine all test set data
        test <- do.call("cbind", lapply(files, read.table))
        ## Combine training and test data into single dataframe
        data <- rbind(train, test)
        ## Read in feature (column variable) names
        features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
        ## Remove redundant objects from memory
        rm("files", "train", "test")
        ## Apply feature names to dataframe columns
        colnames(data)[2:562] <- features[1:561, 2]
        ## Remove redundant object from memory
        rm("features")
        ## Apply header names to Subject and Activity columns
        colnames(data)[1] <- "Subject"
        colnames(data)[563] <- "Activity"
        ## Read in activity labels
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        ## Apply the labels corresponding to each activity in the data
        data$Activity <- factor(data$Activity, labels = activity_labels[1:6, 2])
        ## Remove redundant object from memory
        rm("activity_labels")
        ## Subset dataframe to only include Subject, Activity and columns
        ## related to mean and standard deviation measurements
        data <- data[, c(1, 563, grep("mean|std", names(data), ignore.case = TRUE))]
        ## Load the required dplyr package
        library(dplyr)
        ## Generate tidy data with mean value for each combination of
        ## subject, activity and feature (variable)
        summary <- data %>% group_by(Subject, Activity) %>%
                summarise_each(funs(mean))
        ## Output the resulting summary data as a .txt file
        write.table(summary, output, row.names = FALSE)
}