## ((1)) MERGE DATA SETS

# Load in the data
# Train:
X_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt") # numeric variables
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt") # activity
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt") # subject
# dimensions: dim(X_train) = 7352 x 561; dim(y_train) = 7352 x 1;
#             dim(subject_train) = 7352 x 1

# Test:
X_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt") # numeric variables
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt") # activity
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt") # subject
# dimensions: dim(X_test) = 2947 x 561; dim(y_test) = 2947 x 1;
#             dim(subject_test) = 2947 x 1

# Make them into full data frames
train_df <- cbind(subject_train, y_train, X_train) # train data frame
test_df <- cbind(subject_test, y_test, X_test) # test data frame
# dimensions: dim(train_df) = 7352 x 563; dim(test_df) = 2947 x 563

# Rename first two variables
original_var_names <- names(train_df) # "V1", "V1", "V1", "V2", "V3", ...
new_var_names <- c("subject", "classlabel", original_var_names[3:563])
colnames(train_df) <- new_var_names
colnames(test_df) <- new_var_names

# Merge
full_df <- rbind(train_df, test_df) # full data frame: 10299 x 563

## ((2)) EXTRACT MEASUREMENTS

# Read in feature names
features <- read.table("./UCI_HAR_Dataset/features.txt")  # data frame
featurenames <- features[[2]] # vector of character strings

# Search for "mean()" among feature names
mean_indices <- grep("mean()", featurenames, fixed=TRUE) 
#    fixed = TRUE means only strings including "mean()" exactly will be included
#    and not "meanFreq()"

# Search for "std()" among feature names
std_indices <- grep("std()", featurenames, fixed=TRUE) 

# Choose which columns to keep
feature_indices <- c(mean_indices, std_indices) # length 66
V_indices <- feature_indices + 2 # added y and subject to left of test
full_indices <- c(1,2, V_indices) 
full_indices_sort <- sort(full_indices) # length 68

# Extract measurements
measure_df <- full_df[,full_indices_sort] # measurement data frame: 10299 x 68

## ((3)) NAME ACTIVITIES

# Make new activity labels
activity_labels_txt <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
activity_labels_orig <- activity_labels_txt[,2] # character vector
activity_labels_lc <- tolower(activity_labels_orig) # lowercase
activity_labels <- sub("_", " ", activity_labels_lc) # remove "_" 

# Extract the original class labels
data_class_labels <- measure_df[,2] # integer class coding

# Convert the integers to character strings
data_activities <- sapply(data_class_labels, function(x) activity_labels[x]) 
# uses the fact that the order of the activity_labels vector matches the given
# coding for the class labels

# Replace the current "classlabel" column with "data_activities" as factor
measure_df$classlabel <- as.factor(data_activities)
# Note: this changes the order of the coding, so as.numeric(measure_df$classlabel)
#       will NOT match data_class_labels. The new coding is in the code book.

## ((4)) LABEL DATA SET

# original variable labels
better_labels <- c("subject", "activity", featurenames[feature_indices])

# cleaner/more descriptive variable labels
# replace initial "t" with "time"
featnames1 <- sub("^t", "time", featurenames[feature_indices],)
# replace initial "f" with "freq"
featnames2 <- sub("^f", "freq", featnames1,)
# replace "Acc" with "Accel"
featnames3 <- sub("Acc", "Accel", featnames2,)
# replace "-" with ""
featnames4 <- gsub("-", "", featnames3,)
# replace "()" with ""
featnames5 <- sub("\\()", "", featnames4,)
# fix BodyBody typo 
featnames6 <- sub("BodyBody", "Body", featnames5,)

# final labels, with all columns
final_labels <- c("subject", "activity", featnames6)

# implement the final labels
colnames(measure_df) <- final_labels

## ((5)) CREATE INDEPENDENT TIDY DATA SET 

# install dplyr if necessary and load
pckglist <- rownames(installed.packages()) # vector of installed packages
if(!("dplyr" %in% pckglist)) {install.packages("dplyr")} # install if necessary
library(dplyr) # load

# group by subject and activity and summarize variables
avg_df_init <- tibble::as_tibble(measure_df) # data frame table
avg_df <- avg_df_init %>%
    group_by(subject, activity) %>% 
    summarize(across(everything(), mean, .names = "avg{.col}"), 
              .groups = "drop")
# across allows you to summarize across multiple variables simultaneously
# .names allows you to simultaneously adjust variable names (colnames)
# .groups = "drop" means all levels of grouping are dropped 

# The final data frame, avg_df, has dimensions 180 x 68. Note that we should have
# 180 subject-activity pairs (since 30 subjects x 6 activities = 180 pairs), and
# having 68 variables is consistent with past steps

# write the data to an independent file
write.table(avg_df, file = "avgvar.txt", row.names = FALSE)

# to read this data in directly, use:
# avgvardf <- read.table("avgvar.txt", header = TRUE)
