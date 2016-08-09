filename <- "UCI_data"

if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}


Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
Xtrn <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrn <- read.table("UCI HAR Dataset/train/y_train.txt")
Xcolnames <- read.table("UCI HAR Dataset/features.txt")
subtrn <- read.table("UCI HAR Dataset/train/subject_train.txt")