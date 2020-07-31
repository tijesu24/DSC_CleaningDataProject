library(xlsx)
library(tidyr)
library(dplyr)


features <- as_tibble(
  read.table("./Data/UCI HAR Dataset/features.txt", 
             col.names = c("Id", "Feature")))

# 7. Load the training dataset
#   7.1 Add training data column names from features
#   7.2 Add subject data, and activity data to the training dataset
train <- as_tibble(read.table("./Data/UCI HAR Dataset/train/X_train.txt"))
colnames(train) <- make.unique(features$Feature, "_")
train <- cbind(
  rename(as_tibble(read.table("./Data/UCI HAR Dataset/train/subject_train.txt")), 
         Subject.Id = V1),
  rename(as_tibble(read.table("./Data/UCI HAR Dataset/train/y_train.txt")),
         Activity.Id = V1),
  train)

# 8. Load the test dataset
#   8.1 Add test data column names from features
#   8.2 Add subject data, and activity data to the test dataset
test <- as_tibble(read.table("./Data/UCI HAR Dataset/test/X_test.txt"))
colnames(test) <-  make.unique(features$Feature, "_")
test <- cbind(
  rename(as_tibble(read.table("./Data/UCI HAR Dataset/test/subject_test.txt")), 
         Subject.Id = V1),
  rename(as_tibble(read.table("./Data/UCI HAR Dataset/test/y_test.txt")),
         Activity.Id = V1),
  test)



#To join the test and training data
totalDf <- arrange(merge(test, train,
                         all = TRUE),Subject.Id)


#To extract mean and std
meanstd <- totalDf %>% 
  select(1:3,contains("mean")| contains("std"))
temp <- meanstd

#renaming 
names(meanstd) <- gsub("-", "_",names(meanstd))
names(meanstd) <- gsub("Acc", "accel",names(meanstd))
names(meanstd) <- gsub("^t", "time",names(meanstd))
names(meanstd) <- gsub("^f", "frequency",names(meanstd))
names(meanstd) <- gsub("\\(\\)", "",names(meanstd))
names(meanstd) <- sub("_", "",names(meanstd))
names(meanstd) <- tolower( names(meanstd))
names(meanstd) <- gsub("accel", ".accel",names(meanstd))
names(meanstd) <- gsub("gyro", ".gyro",names(meanstd))
names(meanstd) <- gsub("body", ".body",names(meanstd))
names(meanstd) <- gsub("mean", ".mean",names(meanstd))
names(meanstd) <- gsub("std", ".std",names(meanstd))
names(meanstd) <- gsub("jerk", ".jerk",names(meanstd))
names(meanstd) <- gsub("mag", ".mag",names(meanstd))
names(meanstd) <- gsub("gravity", ".gravity",names(meanstd))

#convert some to numeric


#creating subject average dataframe
subject.average  <- meanstd %>% 
  group_by(subject.id, activity.id) %>% 
  summarise_all(mean)
  