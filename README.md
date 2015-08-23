# run_analysis.R
Assignment from "Getting and Cleaning data"

## Parts
1- Library dependencies
2- Create directories
3- Create paths to files
4- Using local files 
5- Create new dataset
6- Observations

# Library Dependencies

In this part, load packages, we need "data.table" and "reshape2", using require function to try if need install or not.

## Create directories

I create "./datos" directory if dont exist, after that, download the original dataset from url if dont exist too, and finally try to unzip our new dataset with "unzip" function.

## Create path to files

Time to store paths to needed files in new variables with "file.path" function, its good to try script across all platforms.

## Using local files

Reading data from files using "read.table" function and paths created before, i use the paths like constants.

## Create new dataset

Extract mean and std strings with "grepl" function from our features table, and create labels for all our new features, after that merge all data (train and test) in one dataframe with funcitions "cbind" and "rbind".
After that use our new labels in our new dataset with a vector.
I used "setdiff" , "melt" and "dcast" function to manipulate our dataframe.
Finally use "write.table" function to write our "tidy_data.txt" file.


## Observations

I try memisc library to create codebook, but i have problems with other dependencies and syntax, if follow this repo, ill try to create codebook with Rstudio in a few days.


