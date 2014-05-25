##Check for needed packages
if(require("plyr")){
  print("plyr has been loaded correctly")
} else {
  print("trying to install plyr")
  install.packages("plyr")
  if(require(plyr)){
    print("plyr installed and loaded")
  } else {
    stop("could not install plyr")
  }
}
##Check end

#1. Reading Data
features <- read.table("features.txt", stringsAsFactors = T, col.names=c("id","featureName"))

x_test <- read.table("test/X_test.txt", col.names=features$featureName,check.names=F)
x_train <- read.table("train/X_train.txt", col.names=features$featureName,check.names=F)

y_test <- read.table("test/y_test.txt", col.names=c("activityId"))
y_train <- read.table("train/y_train.txt", col.names=c("activityId"))

sub_test <- read.table("test/subject_test.txt", col.names=c("subject"))
sub_train <- read.table("train/subject_train.txt", col.names=c("subject"))
#Merging Data
sub_merge <- rbind(sub_train, sub_test)
x_merge <- rbind(x_train, x_test)
#Remove invalid characters
names(x_merge) <- gsub("\\(|\\)","",names(x_merge))
names(x_merge) <- gsub("_","",names(x_merge))

y_merge <- rbind(y_train, y_test)

##2. extracting interesting features only
interestingFeatures <- grep("mean|std", features$featureName)
x_merge_interesting <- x_merge[,interestingFeatures]

##3 and 4 match activities with labels and rename them
activities <- read.table("activity_labels.txt",  stringsAsFactors = T, col.names=c("id","activityName"))

activities[,2] <- gsub("_","",tolower(as.character(activities[,2])))
activity <- sapply(y_merge$activityId,function(x) activities[activities==x,2])

mergedData <- cbind(x_merge_interesting, activity, sub_merge)
#5 tidy data set with the average of each variable for each activity and each subject
tidyDataSet <- ddply(mergedData,.(activity,subject),numcolwise(mean))

write.table(tidyDataSet, "tidyDataSet.txt")

