library(data.table)
# Read in feature names
# Task 4: Appropriately label variables with descriptive names.
# We use these names as col.names, when reading in the data below.
labels <- read.table('UCI HAR Dataset/features.txt')
colnames <- make.names(as.vector(labels$V2))


# Read in activity labels
# We use these labels when updating the raw data below.
activities <- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('index', 'Activity'))

# Read in the data
test <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=colnames)
test_activities <- read.table('UCI HAR Dataset/test/Y_test.txt', col.names=c('Activity'))
test_subjects <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('Subject'))

train <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=colnames)
train_activities <- read.table('UCI HAR Dataset/train/Y_train.txt', col.names=c('Activity'))
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('Subject'))


# Task 3: Use descriptive activity names
test$Activity <- apply(test_activities, 2, function (a) activities[a,2])
train$Activity <- apply(train_activities, 2, function (a) activities[a,2])


test$Subject <- test_subjects$Subject
train$Subject <- train_subjects$Subject

# Task 1: Merge the test and train set data.
all <- rbind(test,train)

# Task 2: Only get mean and std deviation variables.
mean_std_vars <- make.names(as.vector(labels[grepl("mean|std", labels$V2 ),2]))
all_mean_std <- all[,c('Activity', 'Subject', mean_std_vars)]

# Task 5: Create tidy data set with average of each variable for eadh activity and each subject.
summarized <- aggregate(. ~ Subject * Activity, FUN=mean, data=all_mean_std)
write.table(file='summarized.txt', summarized)
