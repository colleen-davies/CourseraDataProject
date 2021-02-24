Codebook
========

The study
---------

The data used in this project came from the “Human Activity Recognition
Using Smartphones Data Set” \[1\]. The database contains the results of
recording six daily activities for 30 participants using a waist-mounted
smartphone which contained inertial sensors. The sensor signals were
processed in order to produce additional measures. Other details about
the study include \[1\]:

-   The participants ranged in age from 19-48 years.
-   The model of the smartphones used was a Samsung Galaxy S II.
-   The six activities measured were walking, walking upstairs, walking
    downstairs, sitting, standing, laying.
-   The accelerometer and gyroscope captured 3-axial linear acceleration
    and 3-axial angular velocity at a constant rate of 50 Hz.
-   The data was randomly partitioned into a training and testing data
    set for Machine Learning.
-   The study authors applied noise-filters and sampled the sensor
    signals in “fixed-width sliding windows of 2.56 sec and 50% overlap
    (128 readings/window)”. From each window, features were “obtained by
    calculating variables from the time and frequency domain.” \[1\]
-   The acceleration signal was separated into gravitational and body
    motion components using a Butterworth low-pass filter, with a 0.3 Hz
    cutoff frequency.
-   Signals labelled as “frequency domain” were produced using a Fast
    Fourier Transform (FFT).

Further details can be found in the README and features\_info files
provided by the authors with the data set.

Additional analysis
-------------------

Five major steps were completed using run\_analysis.R to produce the
final two data sets. They are

1.  *Merge Data Sets*: merges training and testing data sets;
2.  *Extract Measurements*: extracts only mean() and std() measurements;
3.  *Name Activities*: descriptively names activities;
4.  *Label Data Set*: descriptive labels the variables;
5.  *Create Independent Tidy Data Set*: creates a tidy data set with the
    average of the variables within a subject and activity pair.

A more exhaustive description of how these steps were completed is in
“README.md”. This section is split into two subsections. The first is
for the data set produced in steps 1-4 above \[skip to Measurement data
set\]. The second is for the tidy data set produced by steps 5 \[skip to
Independent tidy data set\] (called avgvar.txt). For both data sets, the
first two variables are “subject” (the study participant number) and
“activity” (the physical activity measured) respectively. All other
variables are named using the following abbreviations:

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
the mentor for this helpful suggestion.

### Measurement data set (Steps 1-4)

To produce this data set, first the training and testing data sets were
individually loaded in, and the data from the X, y, and subject files
were appropriately matched. Then, the training and testing data sets
were merged. From this merged data set, only mean() and std()
measurements were extracted. The class labels (y) were re-coded with
character factors, and the variables were renamed descriptively. The
variables and data are summarized in the following list. The list
includes the variable name, type, the interval in which the values lie
or factor coding, and a description. Note that all numeric features were
normalized so they range between -1 and 1; that is, they are in the
interval \[-1,1\]. In general, variables 1 and 2 are identifiers, then
variables 3 through 35 are means of the measurements with corrresponding
standard deviations 36 through 68.

1.  `subject`: integer; \[1,30\]; the subject who performed the activity
    for the window sample.
2.  `activity`: factor; six levels - 1 “laying”, 2 “sitting”, 3
    “standing”, 4 “walking”, 5 “walking downstairs”, 6 "walking
    upstairs; the activity completed by the subject for the window
    sample.
3.  `timeBodyAccelmeanX`: numeric; \[-1,1\]; the mean of the normalized
    X component of the body time domain signal measured by the
    accelerometer.
4.  `timeBodyAccelmeanY`: numeric; \[-1,1\]; the mean of the normalized
    Y component of the body time domain signal measured by the
    accelerometer.
5.  `timeBodyAccelmeanZ`: numeric; \[-1,1\]; the mean of the normalized
    Z component of the body time domain signal measured by the
    accelerometer.
6.  `timeGravityAccelmeanX`: numeric; \[-1,1\]; the mean of the
    normalized X component of the gravity time domain signal measured by
    the accelerometer.
7.  `timeGravityAccelmeanY`: numeric; \[-1,1\]; the mean of the
    normalized Y component of the gravity time domain signal measured by
    the accelerometer.
8.  `timeGravityAccelmeanZ`: numeric; \[-1,1\]; the mean of the
    normalized Z component of the gravity time domain signal measured by
    the accelerometer.
9.  `timeBodyAccelJerkmeanX`: numeric; \[-1,1\]; the mean of the
    normalized X component of the body time domain Jerk signal measured
    by the accelerometer.
10. `timeBodyAccelJerkmeanY`: numeric; \[-1,1\]; the mean of the
    normalized Y component of the body time domain Jerk signal measured
    by the accelerometer.
11. `timeBodyAccelJerkmeanZ`: numeric; \[-1,1\]; the mean of the
    normalized Z component of the body time domain Jerk signal measured
    by the accelerometer.
12. `timeBodyGyromeanX`: numeric; \[-1,1\]; the mean of the normalized X
    component of the body time domain signal measured by the gyroscope.
13. `timeBodyGyromeanY`: numeric; \[-1,1\]; the mean of the normalized Y
    component of the body time domain signal measured by the gyroscope.
14. `timeBodyGyromeanZ`: numeric; \[-1,1\]; the mean of the normalized Z
    component of the body time domain signal measured by the gyroscope.
15. `timeBodyGyroJerkmeanX`: numeric; \[-1,1\]; the mean of the
    normalized X component of the body time domain Jerk signal measured
    by the gyroscope.
16. `timeBodyGyroJerkmeanY`: numeric; \[-1,1\]; the mean of the
    normalized Y component of the body time domain Jerk signal measured
    by the gyroscope.
17. `timeBodyGyroJerkmeanZ`: numeric; \[-1,1\]; the mean of the
    normalized Z component of the body time domain Jerk signal measured
    by the gyroscope.
18. `timeBodyAccelMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the body time domain signal measured by the
    accelerometer.
19. `timeGravityAccelMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the gravity time domain signal measured by
    the accelerometer.
20. `timeBodyAccelJerkMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the body time domain Jerk signal measured by
    the accelerometer.
21. `timeBodyGyroMagmean`: numeric; \[-1,1\]; the mean of the normalized
    magnitude of the body time domain signal measured by the gyroscope.
22. `timeBodyGyroJerkMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the body time domain Jerk signal measured by
    the gyroscope.
23. `freqBodyAccelmeanX`: numeric; \[-1,1\]; the mean of the normalized
    X component of the result of applying a FFT to the body signal
    measured by the accelerometer.
24. `freqBodyAccelmeanY`: numeric; \[-1,1\]; the mean of the normalized
    Y component of the result of applying a FFT to the body signal
    measured by the accelerometer.
25. `freqBodyAccelmeanZ`: numeric; \[-1,1\]; the mean of the normalized
    Z component of the result of applying a FFT to the body signal
    measured by the accelerometer.
26. `freqBodyAccelJerkmeanX`: numeric; \[-1,1\]; the mean of the
    normalized X component of the result of applying a FFT to the body
    Jerk signal measured by the accelerometer.
27. `freqBodyAccelJerkmeanY`: numeric; \[-1,1\]; the mean of the
    normalized Y component of the result of applying a FFT to the body
    Jerk signal measured by the accelerometer.
28. `freqBodyAccelJerkmeanZ`: numeric; \[-1,1\]; the mean of the
    normalized Z component of the result of applying a FFT to the body
    Jerk signal measured by the accelerometer.
29. `freqBodyGyromeanX`: numeric; \[-1,1\]; the mean of the normalized X
    component of the result of applying a FFT to the body signal
    measured by the gyroscope.
30. `freqBodyGyromeanY`: numeric; \[-1,1\]; the mean of the normalized Y
    component of the result of applying a FFT to the body signal
    measured by the gyroscope.
31. `freqBodyGyromeanZ`: numeric; \[-1,1\]; the mean of the normalized Z
    component of the result of applying a FFT to the body signal
    measured by the gyroscope.
32. `freqBodyAccelMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the result of applying a FFT to the body
    signal measured by the accelerometer.
33. `freqBodyAccelJerkMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the result of applying a FFT to the body
    Jerk signal measured by the accelerometer.
34. `freqBodyGyroMagmean`: numeric; \[-1,1\]; the mean of the normalized
    magnitude of the result of applying a FFT to the body signal
    measured by the gyroscope.
35. `freqBodyGyroJerkMagmean`: numeric; \[-1,1\]; the mean of the
    normalized magnitude of the result of applying a FFT to the body
    Jerk signal measured by the gyroscope.
36. `timeBodyAccelstdX`: numeric; \[-1,1\]; the standard deviation of
    the normalized X component of the body time domain signal measured
    by the accelerometer.
37. `timeBodyAccelstdY`: numeric; \[-1,1\]; the standard deviation of
    the normalized Y component of the body time domain signal measured
    by the accelerometer.
38. `timeBodyAccelstdZ`: numeric; \[-1,1\]; the standard deviation of
    the normalized Z component of the body time domain signal measured
    by the accelerometer.
39. `timeGravityAccelstdX`: numeric; \[-1,1\]; the standard deviation of
    the normalized X component of the gravity time domain signal
    measured by the accelerometer.
40. `timeGravityAccelstdY`: numeric; \[-1,1\]; the standard deviation of
    the normalized Y component of the gravity time domain signal
    measured by the accelerometer.
41. `timeGravityAccelstdZ`: numeric; \[-1,1\]; the standard deviation of
    the normalized Z component of the gravity time domain signal
    measured by the accelerometer.
42. `timeBodyAccelJerkstdX`: numeric; \[-1,1\]; the standard deviation
    of the normalized X component of the body time domain Jerk signal
    measured by the accelerometer.
43. `timeBodyAccelJerkstdY`: numeric; \[-1,1\]; the standard deviation
    of the normalized Y component of the body time domain Jerk signal
    measured by the accelerometer.
44. `timeBodyAccelJerkstdZ`: numeric; \[-1,1\]; the standard deviation
    of the normalized Z component of the body time domain Jerk signal
    measured by the accelerometer.
45. `timeBodyGyrostdX`: numeric; \[-1,1\]; the standard deviation of the
    normalized X component of the body time domain signal measured by
    the gyroscope.
46. `timeBodyGyrostdY`: numeric; \[-1,1\]; the standard deviation of the
    normalized Y component of the body time domain signal measured by
    the gyroscope.
47. `timeBodyGyrostdZ`: numeric; \[-1,1\]; the standard deviation of the
    normalized Z component of the body time domain signal measured by
    the gyroscope.
48. `timeBodyGyroJerkstdX`: numeric; \[-1,1\]; the standard deviation of
    the normalized X component of the body time domain Jerk signal
    measured by the gyroscope.
49. `timeBodyGyroJerkstdY`: numeric; \[-1,1\]; the standard deviation of
    the normalized Y component of the body time domain Jerk signal
    measured by the gyroscope.
50. `timeBodyGyroJerkstdZ`: numeric; \[-1,1\]; the standard deviation of
    the normalized Z component of the body time domain Jerk signal
    measured by the gyroscope.
51. `timeBodyAccelMagstd`: numeric; \[-1,1\]; the standard deviation of
    the normalized magnitude of the body time domain signal measured by
    the accelerometer.
52. `timeGravityAccelMagstd`: numeric; \[-1,1\]; the standard deviation
    of the normalized magnitude of the gravity time domain signal
    measured by the accelerometer.
53. `timeBodyAccelJerkMagstd`: numeric; \[-1,1\]; the standard deviation
    of the normalized magnitude of the body time domain Jerk signal
    measured by the accelerometer.
54. `timeBodyGyroMagstd`: numeric; \[-1,1\]; the standard deviation of
    the normalized magnitude of the body time domain signal measured by
    the gyroscope.
55. `timeBodyGyroJerkMagstd`: numeric; \[-1,1\]; the standard deviation
    of the normalized magnitude of the body time domain Jerk signal
    measured by the gyroscope.
56. `freqBodyAccelstdX`: numeric; \[-1,1\]; the standard deviation of
    the normalized X component of the result of applying a FFT to the
    body signal measured by the accelerometer.
57. `freqBodyAccelstdY`: numeric; \[-1,1\]; the standard deviation of
    the normalized Y component of the result of applying a FFT to the
    body signal measured by the accelerometer.
58. `freqBodyAccelstdZ`: numeric; \[-1,1\]; the standard deviation of
    the normalized Z component of the result of applying a FFT to the
    body signal measured by the accelerometer.
59. `freqBodyAccelJerkstdX`: numeric; \[-1,1\]; the standard deviation
    of the normalized X component of the result of applying a FFT to the
    body Jerk signal measured by the accelerometer.
60. `freqBodyAccelJerkstdY`: numeric; \[-1,1\]; the standard deviation
    of the normalized Y component of the result of applying a FFT to the
    body Jerk signal measured by the accelerometer.
61. `freqBodyAccelJerkstdZ`: numeric; \[-1,1\]; the standard deviation
    of the normalized Z component of the result of applying a FFT to the
    body Jerk signal measured by the accelerometer.
62. `freqBodyGyrostdX`: numeric; \[-1,1\]; the standard deviation of the
    normalized X component of the result of applying a FFT to the body
    signal measured by the gyroscope.
63. `freqBodyGyrostdY`: numeric; \[-1,1\]; the standard deviation of the
    normalized Y component of the result of applying a FFT to the body
    signal measured by the gyroscope.
64. `freqBodyGyrostdZ`: numeric; \[-1,1\]; the standard deviation of the
    normalized Z component of the result of applying a FFT to the body
    signal measured by the gyroscope.
65. `freqBodyAccelMagstd`: numeric; \[-1,1\]; the standard deviation of
    the normalized magnitude of the result of applying a FFT to the body
    signal measured by the accelerometer.
66. `freqBodyAccelJerkMagstd`: numeric; \[-1,1\]; the standard deviation
    of the normalized magnitude of the result of applying a FFT to the
    body Jerk signal measured by the accelerometer.
67. `freqBodyGyroMagstd`: numeric; \[-1,1\]; the standard deviation of
    the normalized magnitude of the result of applying a FFT to the body
    signal measured by the gyroscope.
68. `freqBodyGyroJerkMagstd`: numeric; \[-1,1\]; the standard deviation
    of the normalized magnitude of the result of applying a FFT to the
    body Jerk signal measured by the gyroscope.

The descriptions above were based on the “features\_info.txt” file
provided by the study authors with the data set.

### Independent tidy data set (Step 5)

To produce this data set, the data set produced from Steps 1-4 was then
grouped according to subject and activity, then collapsed so that the
measurement variables are now the average value for a particular subject
for a particular activity. For example, rather than having multiple
observations for subject 1 for the activity “laying”, we now have one
record for this subject-activity pair in which the numeric variables are
now the average of all observations of that variable for that
subject-activity pair. This was achieved using the dplyr package –
specifically with group\_by(), summarize(), and across(). The variables
and data are summarized in the following list. The list includes the
variable name, type, the interval in which the values lie or factor
coding, and a description. These variables are the average within a
subject-activity pair of the variables from the above data set.

1.  `subject`: integer; 1-30; the subject who performed the activity for
    the window sample.
2.  `activity`: factor; six levels - 1 “laying”, 2 “sitting”, 3
    “standing”, 4 “walking”, 5 “walking downstairs”, 6 "walking
    upstairs; the activity completed by the subject for the window
    sample.
3.  `avgtimeBodyAccelmeanX`: numeric; \[0.222,0.301\]; the average of
    the mean of the normalized X component of the body time domain
    signal measured by the accelerometer for a subject-activity pair.
4.  `avgtimeBodyAccelmeanY`: numeric; \[-0.041,-0.001\]; the average of
    the mean of the normalized Y component of the body time domain
    signal measured by the accelerometer for a subject-activity pair.
5.  `avgtimeBodyAccelmeanZ`: numeric; \[-0.153,-0.075\]; the average of
    the mean of the normalized Z component of the body time domain
    signal measured by the accelerometer for a subject-activity pair.
6.  `avgtimeGravityAccelmeanX`: numeric; \[-0.996,0.627\]; the average
    of the mean of the normalized X component of the gravity time domain
    signal measured by the accelerometer for a subject-activity pair.
7.  `avgtimeGravityAccelmeanY`: numeric; \[-0.990,0.617\]; the average
    of the mean of the normalized Y component of the gravity time domain
    signal measured by the accelerometer for a subject-activity pair.
8.  `avgtimeGravityAccelmeanZ`: numeric; \[-0.988,0.609\]; the average
    of the mean of the normalized Z component of the gravity time domain
    signal measured by the accelerometer for a subject-activity pair.
9.  `avgtimeBodyAccelJerkmeanX`: numeric; \[-0.680,0.975\]; the average
    of the mean of the normalized X component of the body time domain
    Jerk signal measured by the accelerometer for a subject-activity
    pair.
10. `avgtimeBodyAccelJerkmeanY`: numeric; \[-0.480,0.957\]; the average
    of the mean of the normalized Y component of the body time domain
    Jerk signal measured by the accelerometer for a subject-activity
    pair.
11. `avgtimeBodyAccelJerkmeanZ`: numeric; \[-0.495,0.958\]; the average
    of the mean of the normalized Z component of the body time domain
    Jerk signal measured by the accelerometer for a subject-activity
    pair.
12. `avgtimeBodyGyromeanX`: numeric; \[-0.997,-0.830\]; the average of
    the mean of the normalized X component of the body time domain
    signal measured by the gyroscope for a subject-activity pair.
13. `avgtimeBodyGyromeanY`: numeric; \[-0.994,-0.644\]; the average of
    the mean of the normalized Y component of the body time domain
    signal measured by the gyroscope for a subject-activity pair.
14. `avgtimeBodyGyromeanZ`: numeric; \[-0.991,-0.610\]; the average of
    the mean of the normalized Z component of the body time domain
    signal measured by the gyroscope for a subject-activity pair.
15. `avgtimeBodyGyroJerkmeanX`: numeric; \[0.043,0.130\]; the average of
    the mean of the normalized X component of the body time domain Jerk
    signal measured by the gyroscope for a subject-activity pair.
16. `avgtimeBodyGyroJerkmeanY`: numeric; \[-0.039,0.057\]; the average
    of the mean of the normalized Y component of the body time domain
    Jerk signal measured by the gyroscope for a subject-activity pair.
17. `avgtimeBodyGyroJerkmeanZ`: numeric; \[-0.067,0.038\]; the average
    of the mean of the normalized Z component of the body time domain
    Jerk signal measured by the gyroscope for a subject-activity pair.
18. `avgtimeBodyAccelMagmean`: numeric; \[-0.995,0.544\]; the average of
    the mean of the normalized magnitude of the body time domain signal
    measured by the accelerometer for a subject-activity pair.
19. `avgtimeGravityAccelMagmean`: numeric; \[-0.990,0.355\]; the average
    of the mean of the normalized magnitude of the gravity time domain
    signal measured by the accelerometerfor a subject-activity pair.
20. `avgtimeBodyAccelJerkMagmean`: numeric; \[-0.993,0.031\]; the
    average of the mean of the normalized magnitude of the body time
    domain Jerk signal measured by the accelerometer for a
    subject-activity pair.
21. `avgtimeBodyGyroMagmean`: numeric; \[-0.206,0.193\]; the average of
    the mean of the normalized magnitude of the body time domain signal
    measured by the gyroscope for a subject-activity pair.
22. `avgtimeBodyGyroJerkMagmean`: numeric; \[-0.204,0.027\]; the average
    of the mean of the normalized magnitude of the body time domain Jerk
    signal measured by the gyroscope for a subject-activity pair.
23. `avgfreqBodyAccelmeanX`: numeric; \[-0.072,0.179\]; the average of
    the mean of the normalized X component of the result of applying a
    FFT to the body signal measured by the accelerometer for a
    subject-activity pair.
24. `avgfreqBodyAccelmeanY`: numeric; \[-0.994,0.268\]; the average of
    the mean of the normalized Y component of the result of applying a
    FFT to the body signal measured by the accelerometer for a
    subject-activity pair.
25. `avgfreqBodyAccelmeanZ`: numeric; \[-0.994,0.477\]; the average of
    the mean of the normalized Z component of the result of applying a
    FFT to the body signal measured by the accelerometer for a
    subject-activity pair.
26. `avgfreqBodyAccelJerkmeanX`: numeric; \[-0.986,0.565\]; the average
    of the mean of the normalized X component of the result of applying
    a FFT to the body Jerk signal measured by the accelerometer for a
    subject-activity pair.
27. `avgfreqBodyAccelJerkmeanY`: numeric; \[-0.157,-0.022\]; the average
    of the mean of the normalized Y component of the result of applying
    a FFT to the body Jerk signal measured by the accelerometer for a
    subject-activity pair.
28. `avgfreqBodyAccelJerkmeanZ`: numeric; \[-0.077,-0.013\]; the average
    of the mean of the normalized Z component of the result of applying
    a FFT to the body Jerk signal measured by the accelerometer for a
    subject-activity pair.
29. `avgfreqBodyGyromeanX`: numeric; \[-0.092,-0.007\]; the average of
    the mean of the normalized X component of the result of applying a
    FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
30. `avgfreqBodyGyromeanY`: numeric; \[-0.997,0.179\]; the average of
    the mean of the normalized Y component of the result of applying a
    FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
31. `avgfreqBodyGyromeanZ`: numeric; \[-0.997,0.296\]; the average of
    the mean of the normalized Z component of the result of applying a
    FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
32. `avgfreqBodyAccelMagmean`: numeric; \[-0.995,0.193\]; the average of
    the mean of the normalized magnitude of the result of applying a FFT
    to the body signal measured by the accelerometer for a
    subject-activity pair.
33. `avgfreqBodyAccelJerkMagmean`: numeric; \[-0.986,0.645\]; the
    average of the mean of the normalized magnitude of the result of
    applying a FFT to the body Jerk signal measured by the accelerometer
    for a subject-activity pair.
34. `avgfreqBodyGyroMagmean`: numeric; \[-0.986,0.428\]; the average of
    the mean of the normalized magnitude of the result of applying a FFT
    to the body signal measured by the gyroscope for a subject-activity
    pair.
35. `avgfreqBodyGyroJerkMagmean`: numeric; \[-0.986,0.645\]; the average
    of the mean of the normalized magnitude of the result of applying a
    FFT to the body Jerk signal measured by the gyroscope for a
    subject-activity pair.
36. `avgtimeBodyAccelstdX`: numeric; \[-0.986,0.428\]; the average of
    the standard deviation of the normalized X component of the body
    time domain signal measured by the accelerometer for a
    subject-activity pair.
37. `avgtimeBodyAccelstdY`: numeric; \[-0.993,0.434\]; the average of
    the standard deviation of thenormalized Y component of the body time
    domain signal measured by the accelerometer for a subject-activity
    pair.
38. `avgtimeBodyAccelstdZ`: numeric; \[-0.995,0.451\]; the average of
    the standard deviation of the normalized Z component of the body
    time domain signal measured by the accelerometer for a
    subject-activity pair.
39. `avgtimeGravityAccelstdX`: numeric; \[-0.981,0.418\]; the average of
    the standard deviation of the normalized X component of the gravity
    time domain signal measured by the accelerometer for a
    subject-activity pair.
40. `avgtimeGravityAccelstdY`: numeric; \[-0.981,0.300\]; the average of
    the standard deviation of the normalized Y component of the gravity
    time domain signal measured by the accelerometer for a
    subject-activity pair.
41. `avgtimeGravityAccelstdZ`: numeric; \[-0.997,0.088\]; the average of
    the standard deviation of the normalized Z component of the gravity
    time domain signal measured by the accelerometer for a
    subject-activity pair.
42. `avgtimeBodyAccelJerkstdX`: numeric; \[-0.998,0.250\]; the average
    of the standard deviation of the normalized X component of the body
    time domain Jerk signal measured by the accelerometer for a
    subject-activity pair.
43. `avgtimeBodyAccelJerkstdY`: numeric; \[-0.995,0.537\]; the average
    of the standard deviation of the normalized Y component of the body
    time domain Jerk signal measured by the accelerometer for a
    subject-activity pair.
44. `avgtimeBodyAccelJerkstdZ`: numeric; \[-0.989,0.524\]; the average
    of the standard deviation of the normalized Z component of the body
    time domain Jerk signal measured by the accelerometer for a
    subject-activity pair.
45. `avgtimeBodyGyrostdX`: numeric; \[-0.989,0.281\]; the average of the
    standard deviation of the normalized X component of the body time
    domain signal measured by the gyroscope for a subject-activity pair.
46. `avgtimeBodyGyrostdY`: numeric; \[-0.997,0.659\]; the average of the
    standard deviation of the normalized Y component of the body time
    domain signal measured by the gyroscope for a subject-activity pair.
47. `avgtimeBodyGyrostdZ`: numeric; \[-0.991,0.560\]; the average of the
    standard deviation of the normalized Z component of the body time
    domain signal measured by the gyroscope for a subject-activity pair.
48. `avgtimeBodyGyroJerkstdX`: numeric; \[-0.987,0.687\]; the average of
    the standard deviation of the normalized X component of the body
    time domain Jerk signal measured by the gyroscope for a
    subject-activity pair.
49. `avgtimeBodyGyroJerkstdY`: numeric; \[-0.995,0.474\]; the average of
    the standard deviation of the normalized Y component of the body
    time domain Jerk signal measured by the gyroscope for a
    subject-activity pair.
50. `avgtimeBodyGyroJerkstdZ`: numeric; \[-0.989,0.277\]; the average of
    the standard deviation of the normalized Z component of the body
    time domain Jerk signal measured by the gyroscope for a
    subject-activity pair.
51. `avgtimeBodyAccelMagstd`: numeric; \[-0.992,0.158\]; the average of
    the standard deviation of the normalized magnitude of the body time
    domain signal measured by the accelerometer for a subject-activity
    pair.
52. `avgtimeGravityAccelMagstd`: numeric; \[-0.995,0.477\]; the average
    of the standard deviation of the normalized magnitude of the gravity
    time domain signal measured by the accelerometer for a
    subject-activity pair.
53. `avgtimeBodyAccelJerkMagstd`: numeric; \[-0.990,0.350\]; the average
    of the standard deviation of the normalized magnitude of the body
    time domain Jerk signal measured by the accelerometer for a
    subject-activity pair.
54. `avgtimeBodyGyroMagstd`: numeric; \[-0.993,-0.006\]; the average of
    the standard deviation of the normalized magnitude of the body time
    domain signal measured by the gyroscope for a subject-activity pair.
55. `avgtimeBodyGyroJerkMagstd`: numeric; \[-0.993,0.475\]; the average
    of the standard deviation of the normalized magnitude of the body
    time domain Jerk signal measured by the gyroscope for a
    subject-activity pair.
56. `avgfreqBodyAccelstdX`: numeric; \[-0.994,0.329\]; the average of
    the standard deviation of the normalized X component of the result
    of applying a FFT to the body signal measured by the accelerometer
    for a subject-activity pair.
57. `avgfreqBodyAccelstdY`: numeric; \[-0.986,0.492\]; the average of
    the standard deviation of the normalized Y component of the result
    of applying a FFT to the body signal measured by the accelerometer
    for a subject-activity pair.
58. `avgfreqBodyAccelstdZ`: numeric; \[-0.995,0.197\]; the average of
    the standard deviation of the normalized Z component of the result
    of applying a FFT to the body signal measured by the accelerometer
    for a subject-activity pair.
59. `avgfreqBodyAccelJerkstdX`: numeric; \[-0.994,0.646\]; the average
    of the standard deviation of the normalized X component of the
    result of applying a FFT to the body Jerk signal measured by the
    accelerometer for a subject-activity pair.
60. `avgfreqBodyAccelJerkstdY`: numeric; \[-0.987,0.522\]; the average
    of the standard deviation of the normalized Y component of the
    result of applying a FFT to the body Jerk signal measured by the
    accelerometer for a subject-activity pair.
61. `avgfreqBodyAccelJerkstdZ`: numeric; \[-0.987,0.587\]; the average
    of the standard deviation of the normalized Z component of the
    result of applying a FFT to the body Jerk signal measured by the
    accelerometer for a subject-activity pair.
62. `avgfreqBodyGyrostdX`: numeric; \[-0.988,0.179\]; the average of the
    standard deviation of the normalized X component of the result of
    applying a FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
63. `avgfreqBodyGyrostdY`: numeric; \[-0.994,0.538\]; the average of the
    standard deviation of the normalized Y component of the result of
    applying a FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
64. `avgfreqBodyGyrostdZ`: numeric; \[-0.994,0.316\]; the average of the
    standard deviation of the normalized Z component of the result of
    applying a FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
65. `avgfreqBodyAccelMagstd`: numeric; \[-0.987,0.204\]; the average of
    the standard deviation of the normalized magnitude of the result of
    applying a FFT to the body signal measured by the accelerometer for
    a subject-activity pair.
66. `avgfreqBodyAccelJerkMagstd`: numeric; \[-0.981,0.237\]; the average
    of the standard deviation of the normalized magnitude of the result
    of applying a FFT to the body Jerk signal measured by the
    accelerometer for a subject-activity pair.
67. `avgfreqBodyGyroMagstd`: numeric; \[-0.998,0.147\]; the average of
    the standard deviation of the normalized magnitude of the result of
    applying a FFT to the body signal measured by the gyroscope for a
    subject-activity pair.
68. `avgfreqBodyGyroJerkMagstd`: numeric; \[-0.998,0.288\]; the average
    of the standard deviation of the normalized magnitude of the result
    of applying a FFT to the body Jerk signal measured by the gyroscope
    for a subject-activity pair.

The descriptions above were based on the “features\_info.txt” file
provided by the study authors with the data set.

Reference:
----------

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
Recognition Using Smartphones. 21th European Symposium on Artificial
Neural Networks, Computational Intelligence and Machine Learning, ESANN
2013. Bruges, Belgium 24-26 April 2013.
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>
