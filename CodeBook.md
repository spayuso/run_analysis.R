### CodeBook.md

CodeBook for "Getting and Cleaning data" assignment.

##run_analysis.R script

We can split script in three parts 

1- Requirements
2- Create dirs, download and unzip files
3- Create paths and read the diferent tables
4- Work with new data and create "tidy_data.txt"


##Requirements
In this part, we should import two librarys, "reshape2" and "data.table" we can use the functions "require()","install.packages()", "library()".


##Create dirs, download and unzip files
This is the second part, we need create a new dir, i called "./datos", after that we need download the dataset to work with, stored in a variable and last one, unzip our dataset.

  Variable name: dwnUrl -> Store the string with the dataset`s url.
  
##Create paths and read the diferent tables

I use file.path in this part cause i want use the same path across all platforms.

Variable name: pathFeatures -> Store path to features.txt file
Variable name: pathActivities ->Store path to activities.txt file
Variable name: pathXtest -> Store path to test/X_test.txt file
Variable name: pathYtest -> Store path to test/Y_test.txt file
Variable name: pathXtrain -> Store path to train/X_train.txt file
Variable name: pathYtrain -> Store path to train/Y_train.txt file
Variable name: pathSubjectTest -> Store pat to test/subject_test.txt
Variable name: pathSubjectTrain -> Store path to test/subject_train.txt

After that start to read file from paths, using read.table() function.

Variable name: activityLabels -> Store info from activities.txt file as a table
Variable name: featuresTab -> Store info from features.txt file as a table
Variable name: xTestTab -> Store info from X_test.txt file as a table
Variable name: yTestTab -> Store info from Y_test.txt file as a table
Variable name: xTrainTab -> Store info from X_train.txt file as a table
Variable name: yTrainTab -> Store info from Y_train.txt file as a table
Variable name: subjectTestTab -> Store info from subject_test.txt file as a table
Variable name: subjectTrainTab -> Store info from subject_train.txt file as a table

## Work with new data and create new tidy_data.txt file.

In this one, i extract features who have "mean()" or "std()" strings in a new variable called meanStd using grepl function.

Create new dataframes with this features using cbind function to merge.

Variable name: newDataTest -> Store test files with "mean and std"
Variable name: newDataTrain -> Store train file with "mean and std"
Variable name: finalData -> Store the result of merge newDataTest and newDataTrain using rbind function.
Variable name: newLabels -> Vector with new names for finalData columns
Variable name: newDataLabels -> New labels without duplicate values in our new dataset (reshape library)
Variable name: newProcData -> New procesed data, stack all columns in only single column (reshape library)
Variable name: perfectTidyData -> Using dcast function to wide our newProcData dataframe (reshape library)

##Finally
I try to create a codebook with memisc function but i have some issues, the lanes are commented because i dnt have time to study how to use memisc syntax.


