# read in the files for the test folder
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

# read in the files for the train folder
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

# combine the test folder contents into one table
test_table <- cbind(x_test, subject_test, y_test)

# combine the train folder contents into one table
train_table <- cbind(x_train, subject_train, y_train)

# combine those two tables into one resulting data set
final_table <- rbind(test_table, train_table)

# name the columns appropriately
# the names for the x_train and x_test datasets comes from features.txt
header <- read.table("UCI HAR Dataset/features.txt")
names(final_table) <- header[,2]
names(final_table)[562] <- "Subject"
names(final_table)[563] <- "Activity"

# extract only the columns of mean or std calculations
final_table <- final_table[,grepl("mean\\(\\)|std\\(\\)|Subject|Activity",colnames(final_table))]

# use the activity labels defined in activity_labels.txt to match the values
# in the "Activity" column to the relevant activity
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_names <- activities[,2]
final_table[,"Activity"] <- activity_names[final_table[,"Activity"]]

# observing the variable names, there are various problems: abbreviations,
# typos (BodyBody), function names (mean()) and unnecessary dashes.
names(final_table) <- gsub("\\(\\)", "", names(final_table))
names(final_table) <- gsub("-", "", names(final_table))
names(final_table) <- gsub("mean", "Mean", names(final_table))
names(final_table) <- gsub("std", "Std", names(final_table))
names(final_table) <- gsub("BodyBody", "Body", names(final_table))
names(final_table) <- gsub("^t", "time", names(final_table))
names(final_table) <- gsub("^f", "frequency", names(final_table))
names(final_table) <- gsub("Acc", "Acceleration", names(final_table))
names(final_table) <- gsub("Gyro", "Gyroscope", names(final_table))
names(final_table) <- gsub("Mag", "Magnitude", names(final_table))

# create the table of means of each measurement for each subject and activity
means_table <- final_table %>% 
                group_by(Subject, Activity) %>% 
                summarise_each(funs(mean))
View(means_table)
write.table(means_table, file = "tidy_dataset.txt", row.names = FALSE)
