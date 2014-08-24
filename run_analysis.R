# Read Training data
# set
train <- read.table(file="UCI HAR Dataset\\train\\X_train.txt")

# subject
train_subject <- read.table(file="UCI HAR Dataset\\train\\subject_train.txt")

# label
train_Activity <- read.table(file="UCI HAR Dataset\\train\\y_train.txt")

# Prepare Training set
train$Subject <- train_subject$V1
train$Activity <- train_Activity$V1


#Read Test data
#set
test <- read.table(file = "UCI HAR Dataset\\test\\X_test.txt")

# subject
test_subject <- read.table(file="UCI HAR Dataset\\test\\subject_test.txt")

# label
test_Activity <- read.table(file="UCI HAR Dataset\\test\\y_test.txt")

# Prepare Test set
test$Subject <- test_subject$V1
test$Activity <- test_Activity$V1

# Merge both Test & Training set
data <- rbind(train, test)


#Read features
features <- read.table(file="UCI HAR Dataset\\features.txt", colClasses= c("integer","character"))

# Add remaining variable labels
features <- rbind(features, c(nrow(features)+1, "subject"))
features <- rbind(features, c(nrow(features)+1, "activity"))

# Use descrptive variable names
names(data) <- features$V2

# extract values which contain either mean ot std
data <- data[, grepl("mean|std|subject|activity", names(data))]

#remove punctuation in variable names
names(data) <- gsub("[[:punct:]]", "", names(data))

# Read Activity label
activties <- read.table(file="UCI HAR Dataset\\activity_labels.txt", colClasses= c("integer","character"))

# Assign activity labels
data$activity <- factor(data$activity, labels= activties$V2)

# Create tidy data set
tidy <- ddply(melt(data, id.vars = c("activity", "subject")),c("activity", "subject"), summarise, mean = mean(value))

# Write it in txt file
write.table(tidy,file ="tidydata.txt", row.name=FALSE)
