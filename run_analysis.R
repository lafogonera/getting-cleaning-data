library(dplyr)

# folderPath variable. 
# Store the path to the "UCI HAR Dataset" Folder, as long as its name if you renamed
folderPath <- "UCI HAR Dataset" #Set your folder path. 


## Functions
loadTable <- function(path) {
    if(!file.exists(path)) {
        stop ("Can't load file. It doesn't exists")
    }
    # store in a temporal variable
    foo <- read.table(path)
    # get dimensions for info purposes
    dimfoo <- dim(foo)
    print(paste("File ", path, "loaded with dimensions-> rows: ", dimfoo[1], "cols: ", dimfoo[2]))
    foo
}

mergeSets <- function(setA, setB) {
    if(ncol(setA) != ncol(setB)){
        stop("This sets doesn't have equal number of columns")

    }
    
    rbind(setA, setB)
}

mergeSetsByColumns <- function(setA, setB, setC) {
    tmp <- c(nrow(setA), nrow(setB), nrow(setC))
    if(length(unique(tmp)) != 1 ) {
        stop("This sets doesn't have equal number of rows")
    } 
    
    cbind(setA, setB, setC)
}

setDescriptiveNames <- function(names) {
    tmp <- names
    # Domain
    tmp <- gsub("^t", "Time", tmp)
    tmp <- gsub("^f", "Frecuency", tmp)
    # Accelerometer and Gyroscop
    tmp <- gsub("Acc", "Accelerometer", tmp)
    tmp <- gsub("Gyro", "Gyroscope", tmp)
    tmp <- gsub("-mean", "Mean", tmp)
    tmp <- gsub("_std", "Std", tmp)
    tmp <- gsub("[()-]", "", tmp)

    tmp
}


# Load Files
activity <- loadTable(file.path(folderPath, "activity_labels.txt"))
features <- loadTable(file.path(folderPath, "features.txt"))

# test
testData       <- loadTable(file.path(folderPath, "test/X_test.txt"))
testLabel      <- loadTable(file.path(folderPath, "test/y_test.txt"))
testSubject    <- loadTable(file.path(folderPath, "test/subject_test.txt"))

# train
trainData      <- loadTable(file.path(folderPath, "train/X_train.txt"))
trainLabel     <- loadTable(file.path(folderPath, "train/y_train.txt"))
trainSubject   <- loadTable(file.path(folderPath, "train/subject_train.txt"))




########################
# steps 1 to 4
# Merges the training and the test sets to create one data set
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names
########################


# Merge initial datasets
totalData      <- mergeSets(testData, trainData)           # All the datas
totalLabel     <- mergeSets(testLabel, trainLabel)         # All the labels
totalSubject   <- mergeSets(testSubject, trainSubject)     # All the subjects    


# Select columns with mean and std and set descriptive names

# Set descriptive activity names to the activities in the data set
totalLabel[ , 1] <- activity[totalLabel[ , 1], 2]


# Store the column indexes and names of the features. Change its names
columnSelection <- list( "colIndex" = grep("mean|std", features$V2), "colNames"=grep("mean|std", features$V2, value=TRUE))
columnSelection$colNames <- setDescriptiveNames(columnSelection$colNames)


# Select the columns that match
dataSelection <- totalData %>% select(columnSelection$colIndex)


# Complete the whole dataset. All pieces together
dataSelection <- mergeSetsByColumns(totalSubject, totalLabel, dataSelection)
names(dataSelection) <- c("subjectID", "activity" , columnSelection$colNames)


########################
# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
########################


averagesTidy <- dataSelection %>% group_by(activity, subjectID) %>% summarise_all(mean)

write.table(x=averagesTidy, file = "assignment.txt", row.names = FALSE )

# To read the file
# myVar <- read.table("assignment.txt", header=TRUE)



                             





