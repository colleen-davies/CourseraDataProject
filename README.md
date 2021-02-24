The Study
=========

The data used in this project came from the “Human Activity Recognition
Using Smartphones Data Set”. The database contains the results of
recording six daily activities for 30 participants using a waist-mounted
smartphone which contained inertial sensors. The sensor signals were
processed in order to produce additional measures. Additional details on
the study can be found in the accompanying codebook, CodeBook.md.

The run\_analysis Script
========================

All of the code is contained in the R script “run\_analysis.R”. Rather
than defining functions, the script is a series of commands which should
all be run to complete the analysis. The script assumes that the
unzipped data directory is saved in the current working directory, with
the directory name changed to “UCI\_HAR\_Dataset”. For your convenience,
the following code can download, unzip, and rename the directory for use
with “run\_analysis.R”.

    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="HAR.zip", method="curl") 
    dateDownloaded <- date()
    unzip("HAR.zip", exdir =".")
    file.rename("UCI HAR Dataset", "UCI_HAR_Dataset")

The script “run\_analysis.R” is split into five sections that correspond
to the steps outlined in the “Getting and Cleaning Data Course Project”
description, that is,

1.  *Merge Data Sets*: merges training and testing data sets;
2.  *Extract Measurements*: extracts only mean() and std() measurements;
3.  *Name Activities*: descriptively names activities;
4.  *Label Data Set*: descriptive labels the variables;
5.  *Create Independent Tidy Data Set*: creates a tidy data set with the
    average of the variables within a subject and activity pair.

Section headings within “run\_analysis.R” appear as a comment with a
double hashtag, the section number in double parantheses, and then the
section title in uppercase lettering.

((1)) Merge Data Sets
---------------------

In this section, we merge the training and testing data sets, found in
the “UCI\_HAR\_Dataset” directory in the working directory.

First, we load in the X, y, and subject data files for both the training
and test data set using read.table(). Then, we combine the X, y, and
subject data files to produce separate training and test data frames
using cbind() \[subject, y, X\]. Given that these data frames have three
variables named “V1”, we immediately change the first two column names
to “subject” and “classlabel” for both data frames to avoid potential
confusion. Lastly, we merge the two data frames using rbind(). The
merged data frame is called “full\_df”.

((2)) Extract Measurements
--------------------------

In this section, we extract only the necessary columns from the merged
data set. Specifically, we keep the “subject” (subject) and “classlabel”
(y) variables, as well as and features (X) that are a “mean()” or
“std()”. We do not include features that are a “meanFreq()”, since these
do not have a direct standard deviation equivalent for the measurements.

To do so, we read in the feature names from the “features.txt” file.
Then we use the grep() function to find the indices corresponding to
feature names containing “mean()” or “std()”. We add 2 to these indices,
since we have added two variables at the start (left) of the dataset,
“subject” and “classlabel”. We produce a combined vector of indices,
including 1 and 2 for “subject” and “classlabel” respectively, which is
sorted in ascending order. Then we subset full\_df using this vector of
indices to extract only the corresponding columns for our new data
frame, “measure\_df”.

((3)) Name Activities
---------------------

In this section, we convert the activities in the “classlabel” column
from numerical factors to character factors. We use the names from
“activity\_labels.txt”, although all lowercase and with the underscores
replaced with a space.

We begin by extracting the original activity labels. We convert them to
lowercase using tolower(), and we replace the underscores with space
using sub(). We then extract the numeric factors, use sapply and
as.factor to convert them to the character factors, and then replace the
classlabel column in “measure\_df” with the activities factor.

((4)) Label Data Set
--------------------

In this section, we replace the current variable names with more
descriptive variable names. We use the original feature names, with a
few changes for readability, including expanding some abbreviations and
removing special characters.

Specifically, we modify the feature names read in at the start of
section ((2)). We use sub to replace the leading “t” with “time”, the
leading “f” with “freq”, and “Acc” with “Accel”. We also use sub and
gsub to remove the “-” and “()” from the feature names. Finally, we fix
the “BodyBody” typo by replacing it using sub with just “Body”. We then
combine the new names into a vector and use colnames() to implement them
in measure\_df.

The final variable names are built from the componens listed below, with
the exception of “subject” and “activity” which have been previously
explained. The abbreviations used in the final variable names for both
the main data frame (measure\_df) and the independent tidy data frame
(avg\_df) are:

-   Accel: measurement based on accelerometer raw signal (originally
    “Acc”)
-   avg: average of measurement within a subject-activity pair
-   Body: body acceleration signal
-   freq: frequency domain signal produced using a Fast Fourier
    Transform (originally “f”)
-   Gravity: gravity acceleration signal
-   Gyro: measurement based on gyroscope raw signal
-   Jerk: signal obtained from deriving body linear acceleration and
    angular velocity in time
-   Mag: magnitude of the three-dimensional signal produced using
    Euclidean norm
-   mean: mean value of measurement estimated from signal
-   std: standard deviation of measurement estimated from signal
-   time: time domain signal (originally “t”)
-   X, Y, Z: direction of the signal measured.

The information in this list is based on the text files included by the
data set’s creators/distributors. Inclusion of an abbreviations list was
suggested by Leonard Greski on the course Discussion Forum. My thanks to
the mentor for this helpful suggestion. There is a section for this data
set in the codebook, CodeBook.md.

((5)) Create Independent Tidy Data Set
--------------------------------------

In this section, we further tidy the data set produced in previous steps
by taking the average of each variable for a subject-activity pair. We
generate a tidy data text file that meets the principles of Hadley
Wickham \[1\].

Here we use the dplyr package, which the script installs if necessary
and loads. We create a data table called avg\_df\_init from our previous
data frame (measure\_df). Then we use the pipeline operator to chain
together two operations. First, we group the records by both subject and
activity using group\_by(). Second, we use summarize combined with
across to take the mean of each variable within a subject-activity pair
(based on examples from \[2\],\[3\]). We then use write.table() to write
the data set to “avgvar.txt”, using row.name=FALSE as instructed on the
submission page. There is a section for this tidy data set in the
codebook, CodeBook.md.

To read this new tidy data set into R, use

    avgvardf <- read.table("avgvar.txt", header = TRUE)

when “avgvar.txt” is saved in the working directory.

References:
===========

\[1\]
<a href="https://vita.had.co.nz/papers/tidy-data.pdf" class="uri">https://vita.had.co.nz/papers/tidy-data.pdf</a>
\[2\]
<a href="https://dplyr.tidyverse.org/reference/across.html" class="uri">https://dplyr.tidyverse.org/reference/across.html</a>
\[3\]
<a href="https://stackoverflow.com/questions/61546643/dplyr-across-function-and-data-frame-length-while-grouping" class="uri">https://stackoverflow.com/questions/61546643/dplyr-across-function-and-data-frame-length-while-grouping</a>
