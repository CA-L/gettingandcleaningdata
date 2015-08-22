<<<<<<< HEAD
## Content of this repository

This repository should contain the README.md file you are currently reading, describing how to read the files contained and run the provided script if required, a CodeBook.md describing the variables, units, description of the data, and the run_analysis.R script that produced the final tidy data set required in the course project.

## Reading the txt file provided

To read in the tidy data set file provided into RStudio, the following blocks of code provide different options.

First, if you have downloaded the txt file from the link provided and saved it into your working directory:
```
data <- read.table("tidy_data.txt", header = TRUE) 
View(data)
```
*Code taken from [David's very long and detailed project FAQ](https://class.coursera.org/getdata-031/forum/thread?thread_id=28)*

Otherwise, this block will download and read in the table for you:
```
address <- "https://s3.amazonaws.com/coursera-uploads/user-feefd440261fd5ff038927ab/975115/asst-3/02b0f730490e11e5aff9d1fbde088cc7.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)
```
*Code taken from [Tidy Data and the Assignment](https://class.coursera.org/getdata-031/forum/thread?thread_id=113)*

## Running the run_analysis.R script

Assumptions: both the run_analysis.R script and the UCI HAR Dataset are in your working directory, and have not been renamed. The [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been downloaded and unzipped, its contents, structure and names are untouched.

Assuming the above is correct, the script can be run with the following code:
```
source("run_analysis.R")
View(means_table)
```

This should result in the same table as seen from the tidy data set file uploaded to Coursera.

## How the resultant data set was created

First, each of the txt files for the train and test folders were read in using read.table. The following picture illustrates the final table structure:

![final table structure](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png)
[Sourced from the Coursera forums](https://class.coursera.org/getdata-031/forum/thread?thread_id=130#comment-893)

`cbind` was used to bind together the contents of the train files (X_train.txt, subject_train.txt, y_train.txt) and the test files (X_test.txt, subject_test.txt, y_test.txt) into a train_table and test_table. `rbind` was then used to bind the rows of those two tables together into the final_table variable.

The "Inertial Signals" folder contents were ignored [as discussed in the forums](https://class.coursera.org/getdata-031/forum/thread?thread_id=28#post-117) since they were not relevant for future column subsetting.

Once combined, the column names had to be determined. The file features.txt provided a listing of the variable names, this was read in, and the second column containing the variable names was used to populate the names of the variables from X_train.txt and X_test.txt. The second-to-last and last columns were named "Subject" and "Activity" as shown in the above diagram.

Then, we were only interested in extracting the columns that measured the mean and standard deviation. From features_info.txt in the UCI HAR Dataset, it explicitly states that the mean and standard deviation are indicated in the column names from "mean()" and "std()". This is further confirmed [in the forums](https://class.coursera.org/getdata-031/forum/thread?thread_id=160).

This extraction is done by:
`final_table <- final_table[,grepl("mean\\(\\)|std\\(\\)|Subject|Activity",colnames(final_table))]`  
The parentheses of `mean()` and `std()` have to be escaped, and Subject and Activity are included. This line of code works by subsetting the `final_table` variable on the columns that match the specified pattern in the column names of the table.

Next, the script changes the Activity column from containing the ids representing the activity, to the activity name as defined in activity_labels.txt.

To produce a tidy dataset, the names of the variables must be clear. The next part of the script dealt with cleaning up these names. As indicated in the comments in run_analysis.R, there were multiple issues with the column names; typos (BodyBody instead of Body), abbreviations, function names `mean()` in the variable names, and unnecessary dashes. 10 changes were made:

* `(1)` removing the parentheses from the variable name
* `(2)` removing the dashes `-`
* `(3)(4)` camelCasing mean and std to adhere to the naming convention
* `(5)` fixing the BodyBody typo to just Body
* `(6)(7)` changing the `t` and `f` (only at the start of each variable!) to time and frequency respectively
* `(8)(9)(10)` changing the abbreviations to their full names as described in features_info.txt

The reason for these changes resulting in a 'tidy' dataset are discussed in the Coursera [lectures](https://class.coursera.org/getdata-031/lecture), [forums](https://class.coursera.org/getdata-031/forum/thread?thread_id=113), and [Hadley's paper on Tidy Data](http://www.jstatsoft.org/v59/i10/paper).

Finally, the resulting tidy data set is created by grouping the Subject and Activity to calculate the mean over all experiments.  
For example: Subject 1 has recorded values for WALKING, but in true scientific format, will have recorded multiple values over different experiments. Thus, we want to know the average of this value for this subject doing this particular activity, and so on.  
From the README.txt and other files, we know there are 30 subjects, each doing 6 activities, which gives us our resultant 180 rows.

=======
# gettingandcleaningdata
Course Project for Coursera Getting and Cleaning Data course.
>>>>>>> 0500b02c493f3842cf958b3f73f844d93fa16907
