# GACD-project

This repo generates a summary for the UCI HAR dataset
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
). It is necesssary to unzip this dataset into the CWD to run the
included code.


The R script `run_analysis.R` combines the training and test datasets.
It extracts only the variables that calculate standard deviation and
mean, and replaces each numerical activity label with its textual
description, and makes the variable names valid R column names.
Finally, it summarizes, per test subject and per activity type, the
mean of each variable. The resulting tidy table is output to a
`summarized.txt` file.


## Files included:

- README.md

  This file, describes the data set and the transformation run by `run_analysis.R`.

- `run_analysis.R`

  The analysis file except, which will generate a `summarized.txt` table.



## Dataset description.

Refer to the UCI HAR dataset description, found in the linked archive
above in the `README.txt` file, for a description of the raw data from
which the summary table is derived. Moreover, refer to the
`features_info.txt` for a detailed description of each measurement.

The generated `summarized.txt` table aggregates the input data from the UCI HAR dataset. The original dataset includes the following variables:

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

Moreover, the dataset includes `mean` and `std` (standard deviation)
aggregates for each trial, for each variable. `-XYZ` columns are
represented individually, so that the resulting dataset separates
(e.g.) `tBodyAcc-X` and `tBodyAcc-Y` observations. Moreover, column
names have included the source dataset aggregate statistic in the name
prior to the (e.g. `tBodyAcc-mean-X` and `tBodyAcc-std-X`) axis name.
In the resulting table, characters that are invalid in R column names
have been replaced by dot (`.`) characters.

The HCI HAR dataset includes multiple trials per test subject, per
activity. In the `summarized.txt` dataset, we group records by
`Subject` and `Activity`, then calculate the mean of each input
variable for group of trials. The resulting mean is then the value
included for the variable in each row representing a `Subject` *
`Activity` pair. The numerical `Subject` id, and the textual
`Activity` description, are included in the `summarized.txt` table.


## LICENSE

The code `run_analysis.R` and derived summary data `summarized.txt` are released to the public domain, subject to the restrictions of the original source license for the dataset, found in the `README.txt` of the original dataset, and included below:

    Use of this dataset in publications must be acknowledged by
    referencing the following publication [1]

    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
    Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones
    using a Multiclass Hardware-Friendly Support Vector Machine.
    International Workshop of Ambient Assisted Living (IWAAL 2012).
    Vitoria-Gasteiz, Spain. Dec 2012

    This dataset is distributed AS-IS and no responsibility implied or
    explicit can be addressed to the authors or their institutions for
    its use or misuse. Any commercial use is prohibited.

    Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
