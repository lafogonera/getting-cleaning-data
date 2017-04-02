# getting-cleaning-data 

[TOC]



## Files in the repository
- readme.md (this file)
- run_analysis.R ( R script )
- codebook.md ( codebook for the variables of the resulting dataframe )

## run_analysis.R
This is the script that does the following. 

From the data for the project
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the - average of each variable for each activity and each subject.

### Configuration
- `folderPath`: On line 5 of the script there is defined a variable named `folderPath` . This is the path to the folder with the data of the project. It assumes that this folder is on your working directory and has the name **UCI HAR Dataset** . If not, modify its value to accomplish your personal configuration. 
- Library `dplyr` is needed.

### Functions
The script defines four helper functions
- `loadTable`: Checks if the file we want to load, it exists. If true, it loads it with `read.table`
- `mergeSets`: Checks if two sets have the same number of columns. If true, it merges both with `rbind`
- `mergeSetsByColumns`: Checks if three data sets have the same number of rows. If true, it merges all of them with `cbind`
- `setDescriptiveNames`: Rename the columns of the data set with descriptive names. It follow the general rules:
	- ~~All lower case when possible~~ Due to the lenght of the names I'm not following this rule
	- Descriptive names ( Diagnosis versus Dx )
	- Not have underscores, or dots or white spaces

### Variables
- `activity`: *data.frame* : stores **activity_labes.txt**
- `features`: *data.frame* : stores **features.txt**
- `testData`: *data.frame* : stores **test/X_test.txt**
- `testLabel`: *data.frame* : stores **test/y_test.txt**
- `testSubject`: *data.frame* : stores **test/subject_test.txt**
- `trainData`: *data.frame* : stores **train/X_train.txt**
- `trainLabel`: *data.frame* : stores **train/y_train.txt**
- `trainSubject`: *data.frame* : stores **train/subject_train.txt**
++
- `totalData`: *data.frame* : Merges observations from `testData` and `trainData`
- `totalLabel`: *data.frame* : Merges activity labels from test (`testLabel`) and train (`trainLabel`) observations
- `totalSubject`: *data.frame* : Merges all the 30 subjects `testSubject` and `trainSubject` 
- `columnSelection`: *list* : stores the index and the names of the *mean*, *std* variables 
	- `colIndex`: *integer*: 
	- `colNames`: *character*:   
++
- `dataSelection`: *data.frame* it's a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) that comply the first 4 tasks of the assignement. 
- `averagesTidy`: *grouped_df* Accomplish the last task of the assignment. 

### Script behaviour
- The script load all the files
- Merges data, label and subject from test and train into three different data sets
- Modify the dataframe with the labels, setting the descriptive names from the **activity.txt** file
- get the indexes and names of the columns with mean and standard deviation for each measurement
- select this columns into a new datafram `dataSelection`. Combine in this variable the data, labels and subjects with `cbind`
- set the descriptive names for all the columns in `dataSelection`
- Makes a summary of the averages of this variables grouping by activity and subject.
- Stores the result on a file named **assignment.txt**
- To load this file make, `myVar <- read.table("assignment.txt", header=TRUE)`
- The file **assignment.txt** dimension is 180 rows and 81 columns.
	- the file is grouped by `activity` (6 values, `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`)  and by `subjectID` ( 30 values, from `1` to `30`), thus, 6x30 = 180 rows
	- The file has 79 columns related to means or standard deviation, plus the activity and the subjectId columns. (total 81) 

### Instruction list
- load `run_analysis.R` into the root of your working directory
- The file assumes that you have a folder `UCI HAR Dataset` also in the root of your working directory.
- If you have another configuration, modify the `folderPath` variable in line 5 of the `run_analysis.R` file
- Run the script
- The script stores a file in your working directory named **assignment.txt**
- load this file by making, `myVar <- read.table("assignment.txt", header=TRUE)`







